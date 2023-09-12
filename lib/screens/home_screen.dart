import 'dart:convert';

import 'package:beatflow/services/misc_services.dart';
import 'package:beatflow/widgets/home_grid.dart';
import 'package:beatflow/widgets/home_list.dart';
import 'package:beatflow/widgets/icon_btn.dart';
import 'package:beatflow/widgets/persistend_header.dart';
import 'package:beatflow/widgets/tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _getSelectedIndex = 0;
  var recentlyPlayedSongs = [];
  var isLoading = false;
  getRecentlyPlayedSongs() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString("access_token");
    print("token $accessToken");
    var res = await http.get(
        Uri.parse(
            "https://api.spotify.com/v1/me/player/recently-played?limit=4"),
        headers: {"Authorization": "Bearer $accessToken"});

    if (res.statusCode != 200) {
      print("Error");
      print(res.body);
      return;
    }

    setState(() {
      recentlyPlayedSongs = jsonDecode(res.body)['items'];
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getRecentlyPlayedSongs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 60,
                title: Text(
                  "Good ${MiscServices.getCurrentTime}",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                actions: [
                  IconBtn(
                    onIconClick: () {},
                    icon: const FaIcon(FontAwesomeIcons.bell),
                  ),
                  IconBtn(
                    onIconClick: () {},
                    icon: const FaIcon(FontAwesomeIcons.clockRotateLeft),
                  ),
                  IconBtn(
                    onIconClick: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.gear,
                    ),
                  )
                ],
              ),
              SliverPersistentHeader(
                delegate: PersistentHeaderDelegate(
                  child: const PreferredSize(
                    preferredSize: Size.fromHeight(70),
                    child: Tabs(),
                  ),
                ),
                pinned: true,
              ),
              const HomeGrid(),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 34,
                ),
              ),
              const HomeList(title: "Today's Biggest Hits"),
              const HomeList(title: "Today's Biggest Hits"),
              const HomeList(title: "Today's Biggest Hits"),
              const HomeList(title: "Today's Biggest Hits"),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            elevation: 4,
            backgroundColor: const Color.fromARGB(167, 59, 59, 59),
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                _getSelectedIndex = value;
              });
            },
            enableFeedback: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                label: "Search",
                icon: Icon(
                  CupertinoIcons.search,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                label: "Your Library",
                icon: Icon(
                  CupertinoIcons.book,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                label: "Premium",
                icon: FaIcon(
                  FontAwesomeIcons.spotify,
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }
}
