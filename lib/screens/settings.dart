import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpapers/bloc/change_theme_bloc.dart';
import 'package:wallpapers/bloc/change_theme_state.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int option;
  final List<Color> colors = [Colors.white, Color(0xff323639), Colors.black];
  final List<Color> borders = [Colors.black, Colors.white, Colors.white];
  final List<String> themes = ['Light', 'Dark', 'Amoled'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: changeThemeBloc,
      builder: (BuildContext context, ChangeThemeState state) {
        return Theme(
            data: state.themeData,
            child: Container(
              color: state.themeData.primaryColor,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.brightness_4),
                    title: Text(
                      'Theme',
                      style: state.themeData.textTheme.body2,
                    ),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 2, color: state.themeData.accentColor),
                          color: state.themeData.primaryColor),
                    ),
                    onTap: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      option = preferences.get('theme_option') ?? 0;
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return BlocBuilder(
                              bloc: changeThemeBloc,
                              builder: (BuildContext context,
                                  ChangeThemeState state) {
                                return AlertDialog(
                                  backgroundColor: state.themeData.primaryColor,
                                  title: Text(
                                    'Change Theme',
                                    style: state.themeData.textTheme.body1,
                                  ),
                                  content: SizedBox(
                                    height: 100,
                                    child: Center(
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: 3,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Stack(
                                            children: <Widget>[
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              width: 2,
                                                              color: borders[
                                                                  index]),
                                                          color: colors[index]),
                                                    ),
                                                  ),
                                                  Text(themes[index],
                                                      style: state.themeData
                                                          .textTheme.body2)
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          switch (index) {
                                                            case 0:
                                                              changeThemeBloc
                                                                  .onLightThemeChange();
                                                              break;
                                                            case 1:
                                                              changeThemeBloc
                                                                  .onDarkThemeChange();
                                                              break;
                                                            case 2:
                                                              changeThemeBloc
                                                                  .onAmoledThemeChange();
                                                              break;
                                                          }
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 50,
                                                        height: 50,
                                                        child: state.themeData
                                                                    .primaryColor ==
                                                                colors[index]
                                                            ? Icon(Icons.done,
                                                                color: state
                                                                    .themeData
                                                                    .accentColor)
                                                            : Container(),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(themes[index],
                                                      style: state.themeData
                                                          .textTheme.body2)
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text(
                      'About',
                      style: state.themeData.textTheme.body2,
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
