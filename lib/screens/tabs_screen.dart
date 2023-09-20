import 'package:beatflow/screens/home_screen.dart';
import 'package:beatflow/screens/library_screen.dart';
import 'package:beatflow/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int getSelectedIndex = 0;
  var recentlyPlayedSongs = [];
  var isLoading = false;

  List<Widget> tabs = [
    const HomeScreen(),
    const SearchScreen(),
    const LibraryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    void changeNavigation(value) {
      setState(() {
        getSelectedIndex = value;
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: tabs[getSelectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: getSelectedIndex,
          elevation: 4,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(color: Colors.white),
          unselectedLabelStyle: const TextStyle(color: Colors.white),
          backgroundColor: const Color.fromARGB(167, 59, 59, 59),
          type: BottomNavigationBarType.fixed,
          onTap: changeNavigation,
          enableFeedback: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.houseChimney,
                size: 20,
                color: Colors.white,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 20,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: "Your Library",
              icon: Icon(
                FontAwesomeIcons.bookBookmark,
                size: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
