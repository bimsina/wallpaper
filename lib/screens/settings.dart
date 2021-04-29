import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers/theme/theme_state.dart';
import 'package:wallpapers/theme/utils.dart';

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
    final state = Provider.of<ThemeState>(context);
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
                  style: state.themeData.textTheme.bodyText1,
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
                  showThemeChangerDialog(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text(
                  'About',
                  style: state.themeData.textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ));
  }
}

showThemeChangerDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) => ThemeChangerWidget(),
  );
}

class ThemeChangerWidget extends StatelessWidget {
  final List<String> string = ['Light', 'Dark', 'Amoled'];
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ThemeState>(context);

    final groupEnumValue = state.themeData == kLightTheme
        ? ThemeStateEnum.light
        : state.themeData == kDarkTheme
            ? ThemeStateEnum.dark
            : ThemeStateEnum.amoled;

    return Theme(
      data: state.themeData
          .copyWith(unselectedWidgetColor: state.themeData.accentColor),
      child: AlertDialog(
          backgroundColor: state.themeData.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          title:
              Text('Select Theme', style: state.themeData.textTheme.bodyText2),
          content: Container(
            width: 0.0,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RadioListTile<ThemeStateEnum>(
                  value: ThemeStateEnum.values[index],
                  groupValue: groupEnumValue,
                  onChanged: (ind) {
                    state.saveOptionValue(ind);
                  },
                  title: Text(
                    string[index],
                    style: state.themeData.textTheme.bodyText1,
                  ),
                );
              },
              itemCount: string.length,
            ),
          )),
    );
  }
}
