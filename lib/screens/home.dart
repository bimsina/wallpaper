import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpapers/bloc/change_theme_bloc.dart';
import 'package:wallpapers/bloc/change_theme_state.dart';
import 'package:wallpapers/screens/category.dart';
import 'package:wallpapers/screens/main_page.dart';
import 'package:wallpapers/screens/settings.dart';
import 'package:wallpapers/utils/exapndingnav.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageIndex = 0;
  PageController pageController = PageController();
  List<String> wallpapers = ['Batman', 'Minimal', 'Apple'];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: changeThemeBloc,
      builder: (BuildContext context, ChangeThemeState state) {
        return Theme(
          data: state.themeData,
          child: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                elevation: 5,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    Text(
                      'Wallpapers',
                      style: state.themeData.textTheme.headline,
                    )
                  ],
                ),
                // actions: <Widget>[
                //   IconButton(
                //     icon:
                //         Icon(Icons.search, color: state.themeData.accentColor),
                //     onPressed: () async {
                //       final String result = await showSearch(
                //           context: context,
                //           delegate: WallpaperSearch(wallpapers: wallpapers));
                //       if (result != null) {
                //         print(result);
                //       }
                //     },
                //   )
                // ],
                backgroundColor: state.themeData.primaryColor),
            body: Container(
              color: state.themeData.primaryColor,
              child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: pageController,
                  onPageChanged: onPageChanged,
                  children: <Widget>[
                    MainBody(),
                    Category(),
                    SettingsPage(),
                  ]),
            ),
            bottomNavigationBar: ExpandingBottomBar(
              backgroundColor: state.themeData.primaryColor,
              navBarHeight: 60.0,
              items: [
                ExpandingBottomBarItem(
                  icon: Icons.home,
                  text: "Home",
                  selectedColor: state.themeData.accentColor,
                ),
                ExpandingBottomBarItem(
                  icon: Icons.category,
                  text: "Categories",
                  selectedColor: state.themeData.accentColor,
                ),
                ExpandingBottomBarItem(
                  icon: Icons.settings,
                  text: "Settings",
                  selectedColor: state.themeData.accentColor,
                ),
              ],
              selectedIndex: pageIndex,
              onIndexChanged: navigationTapped,
            ),
          ),
        );
      },
    );
  }

  void onPageChanged(int value) {
    setState(() {
      pageIndex = value;
    });
  }

  void navigationTapped(int value) {
    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
