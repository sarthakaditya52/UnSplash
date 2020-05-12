import 'package:flutter/material.dart';
import 'package:unsplash/services/getImages.dart';
import 'package:unsplash/services/imageData.dart';

class Nature extends StatefulWidget {
  @override
  _NatureState createState() => _NatureState();
}

class _NatureState extends State<Nature> {

  String collection = '1580860';
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
      body: Text('Nature Tab'),
    );
  }
}
