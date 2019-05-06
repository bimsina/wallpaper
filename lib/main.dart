import 'package:flutter/material.dart';
import 'package:wallpapers/screens/home.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder(
//       bloc: changeThemeBloc,
//       builder: (BuildContext context, ChangeThemeState state) {
//         return MaterialApp(
//           theme: state.themeData,
//           home: Scaffold(
//             appBar: AppBar(
//               title: Text('Theme Changer'),
//             ),
//             body: Container(
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     RaisedButton(
//                       child: Text('Dark Theme'),
//                       color: state.themeData.primaryColor,
//                       onPressed: changeThemeBloc.onDarkThemeChange,
//                     ),
//                     SizedBox(
//                       height: 50.0,
//                     ),
//                     RaisedButton(
//                       child: Text('Light Theme'),
//                       onPressed: changeThemeBloc.onLightThemeChange,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpapers',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
