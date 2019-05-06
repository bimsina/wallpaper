import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final List<String> _category = [
    'Minimal',
    'Vector Art',
    'Superhero',
    'Earth',
    'Ocean'
  ];
  final List<String> _categoryImage = [
    'http://ilovepapers.com/wp-content/uploads/papers.co-ar13-minimal-sunset-art-illustration-dark-blue-6-wallpaper.jpg',
    'https://image.freepik.com/free-vector/abstract-dynamic-pattern-wallpaper-vector_53876-43459.jpg',
    'http://www.4usky.com/data/out/90/164812574-superhero-wallpapers.jpg',
    'http://www.thelawofattraction.com/wp-content/uploads/law-of-polarity.png',
    'https://i.pinimg.com/originals/00/aa/e7/00aae7cd6cbae92d0f5d00baab3fe289.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width / 2;
    return Container(
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Categories',
                        style: Theme.of(context).textTheme.body1),
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: _category.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: _width,
                            height: _width - 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: FadeInImage(
                                image: NetworkImage(_categoryImage[index]),
                                fit: BoxFit.cover,
                                placeholder:
                                    AssetImage('assets/images/loading.gif'),
                              ),
                            ),
                          ),
                        ),
                        Text(_category[index],
                            style: Theme.of(context).textTheme.body2),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
