import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class WallpaperPage extends StatefulWidget {
  final String heroId, imageUrl;
  final ThemeData themeData;
  WallpaperPage(
      {@required this.heroId, @required this.imageUrl, this.themeData});
  @override
  _WallpaperPageState createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  bool downloading = false;
  var progressString = "";

  Widget myBody(BuildContext context) {
    return Theme(
      data: widget.themeData,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Hero(
              tag: widget.heroId,
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
            Positioned(
              top: 28,
              left: 8,
              child: FloatingActionButton(
                tooltip: 'Close',
                child: Icon(
                  Icons.clear,
                  color: widget.themeData.accentColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                heroTag: 'close',
                mini: true,
                backgroundColor: widget.themeData.primaryColor.withOpacity(0.5),
              ),
            ),
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                      // width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height - 150,
                      ),
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Container(
                        width: double.infinity,
                        // height: MediaQuery.of(context).size.height - 200,
                        decoration: BoxDecoration(
                            color:
                                widget.themeData.primaryColor.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0))),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16.0, left: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Bibek Timsina',
                                    style: widget.themeData.textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.image),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(Icons.open_in_new),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(Icons.file_download),
                                  onPressed: () {
                                    // setState(() {
                                    //   downloading = true;
                                    // });
                                    // downloadImage();
                                  },
                                ),
                                // Text(
                                //   !downloading
                                //       ? 'Not yet'
                                //       : 'Downloading $progressString',
                                //   style: widget.themeData.textTheme.bodyText1,
                                // )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 16.0,
                      top: 0.0,
                      child: FloatingActionButton(
                        tooltip: 'Set as Wallpaper',
                        backgroundColor: widget.themeData.primaryColor,
                        child: Icon(
                          Icons.format_paint,
                          color: widget.themeData.accentColor,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> downloadImage() async {
    Dio dio = Dio();

    try {
      var directory = await getExternalStorageDirectory();
      // var dir = await getApplicationDocumentsDirectory();

      await dio.download(widget.imageUrl,
          "${directory.path}/${DateTime.now().toUtc().toIso8601String()}.png",
          onReceiveProgress: (rec, total) {
        // print("Rec: $rec , Total: $total");

        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
  }

  @override
  Widget build(BuildContext context) {
    return myBody(context);
  }
}
