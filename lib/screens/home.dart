import 'package:wallpapers/screens/category.dart';
import 'package:wallpapers/screens/main_page.dart';
import 'package:wallpapers/screens/search_view.dart';
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

  Widget collapsingBody() {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: false,
              pinned: false,
              flexibleSpace: AppBar(
                elevation: 0,
                centerTitle: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    Text(
                      'Wallpapers',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    )
                  ],
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    onPressed: () async {
                      final String result = await showSearch(
                          context: context,
                          delegate: WallpaperSearch(wallpapers: wallpapers));
                      if (result != null) {
                        print(result);
                      }
                    },
                  )
                ],
                backgroundColor: Theme.of(context).accentColor,
              ),
            ),
          ];
        },
        body: Container(
          color: Colors.white,
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
      ),
      bottomNavigationBar: ExpandingBottomBar(
        navBarHeight: 60.0,
        items: [
          ExpandingBottomBarItem(
            icon: Icons.home,
            text: "Home",
            selectedColor: Colors.purple,
          ),
          ExpandingBottomBarItem(
            icon: Icons.category,
            text: "Categories",
            selectedColor: Colors.purple,
          ),
          ExpandingBottomBarItem(
            icon: Icons.settings,
            text: "Settings",
            selectedColor: Colors.purple,
          ),
        ],
        selectedIndex: pageIndex,
        onIndexChanged: navigationTapped,
      ),
    );
  }

  Widget myBody() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset('assets/images/logo.png'),
            ),
            Text(
              'Wallpapers',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () async {
              final String result = await showSearch(
                  context: context,
                  delegate: WallpaperSearch(wallpapers: wallpapers));
              if (result != null) {
                print(result);
              }
            },
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
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
        navBarHeight: 60.0,
        items: [
          ExpandingBottomBarItem(
            icon: Icons.home,
            text: "Home",
            selectedColor: Colors.deepPurple,
          ),
          ExpandingBottomBarItem(
            icon: Icons.category,
            text: "Categories",
            selectedColor: Colors.red,
          ),
          ExpandingBottomBarItem(
            icon: Icons.settings,
            text: "Settings",
            selectedColor: Colors.green,
          ),
        ],
        selectedIndex: pageIndex,
        onIndexChanged: navigationTapped,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return myBody();
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
