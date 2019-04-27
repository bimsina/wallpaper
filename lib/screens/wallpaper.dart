import 'package:flutter/material.dart';

class WallpaperPage extends StatefulWidget {
  final String heroId, imageUrl;
  WallpaperPage({@required this.heroId, @required this.imageUrl});
  @override
  _WallpaperPageState createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Hero(
          tag: widget.heroId,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: double.infinity,
                child: FadeInImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/images/loading.gif'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
