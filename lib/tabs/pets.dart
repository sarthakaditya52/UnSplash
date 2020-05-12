import 'package:flutter/material.dart';
import 'package:unsplash/services/getImages.dart';
import 'package:unsplash/services/imageData.dart';

class Pets extends StatefulWidget {
  @override
  _PetsState createState() => _PetsState();
}

class _PetsState extends State<Pets> {

  String collection = '139386';
  List<ImageData> images;

  void storeImages() async {
    images = await getPhotos(collection);
    print(images);
  }

  @override
  void initState() {
    super.initState();
    storeImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Pets Tab'),
    );
  }
}
