import 'package:Wallpapers/screens/category.dart';
import 'package:Wallpapers/screens/main_page.dart';
import 'package:Wallpapers/utils/exapndingnav.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageIndex = 0;
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   // title: Padding(
      //   //   padding: const EdgeInsets.all(8.0),
      //   //   child: Image.asset('assets/images/logo.png'),
      //   // ),
      //   title: Text(
      //     'Wallpapers',
      //     style: TextStyle(
      //         color: Colors.black,
      //         fontFamily: 'Sans',
      //         fontWeight: FontWeight.bold,fontSize: 24),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      // body: Column(
      //   children: <Widget>[
      //     Expanded(
      //       child: PageView(
      //           controller: pageController,
      //           onPageChanged: onPageChanged,
      //           children: <Widget>[
      //             MainBody(),
      //             Category(),
      //             Container(color: Colors.black),
      //             Container(color: Colors.purple),
      //           ]),
      //     ),
      //   ],
      // ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: false,
              pinned: false,
              flexibleSpace: AppBar(
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                backgroundColor: Colors.white,
              ),
            ),
          ];
        },
        body: PageView(
            physics: BouncingScrollPhysics(),
            controller: pageController,
            onPageChanged: onPageChanged,
            children: <Widget>[
              MainBody(),
              Category(),
              Container(color: Colors.black),
              Container(color: Colors.purple),
            ]),
      ),
      bottomNavigationBar: ExpandingBottomBar(
        navBarHeight: 65.0,
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
            icon: Icons.search,
            text: "Search",
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
