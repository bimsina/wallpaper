import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width / 2;
    return Container(
        color: Colors.white,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Categories',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: _width,
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: FadeInImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1507608616759-54f48f0af0ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80'),
                                fit: BoxFit.cover,
                                placeholder:
                                    AssetImage('assets/images/loading.gif'),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Categories',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
