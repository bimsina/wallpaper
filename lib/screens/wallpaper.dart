import 'package:flutter/material.dart';

class WallpaperPage extends StatefulWidget {
  final String heroId, imageUrl;
  WallpaperPage({@required this.heroId, @required this.imageUrl});
  @override
  _WallpaperPageState createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  bool _iconsVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Hero(
              tag: widget.heroId,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _iconsVisibility = !_iconsVisibility;
                  });
                },
                onVerticalDragStart: (drag) {
                  _showBottomSheet(context);
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: FadeInImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/images/loading.gif'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 28,
              left: 8,
              child: Visibility(
                visible: _iconsVisibility,
                child: FloatingActionButton(
                  heroTag: 'close',
                  backgroundColor: Colors.purple,
                  mini: true,
                  child: Icon(Icons.clear),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 0,
              left: 0,
              child: Visibility(
                visible: _iconsVisibility,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: 'fab1',
                      child: Icon(Icons.info),
                      backgroundColor: Colors.purple,
                      mini: false,
                      onPressed: () {
                        _showBottomSheet(context);
                      },
                    ),
                    FloatingActionButton(
                      heroTag: 'fab2',
                      child: Icon(Icons.file_download),
                      backgroundColor: Colors.purple,
                      mini: false,
                      onPressed: () {},
                    ),
                    FloatingActionButton(
                      heroTag: 'fab3',
                      child: Icon(Icons.done),
                      backgroundColor: Colors.purple,
                      mini: false,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text('Music'),
                  onTap: () => {}),
              ListTile(
                leading: Icon(Icons.videocam),
                title: Text('Video'),
                onTap: () => {},
              ),
            ],
          ),
        );
      });
}
