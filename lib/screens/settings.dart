import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Settings',
                  style: TextStyle(
                      color: Colors.black, fontSize: 24),
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            trailing: Switch(
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}