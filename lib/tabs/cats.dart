import 'package:flutter/material.dart';
import 'package:unsplash/services/getImages.dart';
import 'package:unsplash/services/imageData.dart';
import 'package:unsplash/widgets/imageTile.dart';
//Cats

class Cats extends StatefulWidget {
  @override
  _CatsState createState() => _CatsState();
}

class _CatsState extends State<Cats> {

  String collection = '139386';
  List<ImageData> images = [];

  void storeImages() async {
    List<ImageData> img = await getPhotos(collection,'Cat');
    setState(() {
      images = img;
    });
  }

  @override
  void initState() {
    super.initState();
    storeImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: const EdgeInsets.all(8),
          childAspectRatio: 0.6,
          physics: ScrollPhysics(),
          children:images.map<Widget>( (photo) {
            return GestureDetector(
              child: ImageTile(
                photo: photo,
              ),
            );
          }).toList()),
    );
  }
}
