import 'package:beatflow/services/misc_services.dart';
import 'package:beatflow/widgets/home_grid.dart';
import 'package:beatflow/widgets/home_list.dart';
import 'package:beatflow/widgets/icon_btn.dart';
import 'package:beatflow/widgets/persistend_header.dart';
import 'package:beatflow/widgets/tabs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void logout() async {
    var logger = Logger();
    logger.i("Inside Func logout");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final res = await prefs.remove("access_token");
    logger.i("Remvoe status $res");
    if (context.mounted) {
      logger.i("Inside navigation block");
      context.go('/auth');
      logger.i("passed navigation block");
    }
    logger.i("closed navigation block");
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
              onIconClick: logout,
              icon: const FaIcon(
                FontAwesomeIcons.backward,
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
        HomeGrid(),
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
    );
  }
}
