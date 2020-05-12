import 'package:flutter/material.dart';
import 'package:unsplash/services/getImages.dart';
import 'package:unsplash/services/imageData.dart';
import 'package:unsplash/widgets/imageTile.dart';
//One item - white background

class OneItem extends StatefulWidget {

  @override
  _OneItemState createState() => _OneItemState();
}

class _OneItemState extends State<OneItem> {

  String collection = '1580860';
  List<ImageData> images = [];
  int pageNo = 1;
  ScrollController _scrollController = new ScrollController();

  void storeImages() async {
    List<ImageData> img = await getPhotos(collection,'One item - white background', pageNo);
    setState(() {
      images = img;
    });
  }

  @override
  void initState() {
    super.initState();
    storeImages();
    _scrollController.addListener(() async {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        pageNo++;
        List<ImageData> newImgs = await getPhotos(collection,'One item - white background', pageNo);
        List<ImageData> temp = images;
        temp.addAll(newImgs);
        setState(() {
          images = temp;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
        controller: _scrollController,
        physics: ScrollPhysics(),
        children:images.map<Widget>( (photo) {
          return GestureDetector(
            child: ImageTile(
              photo: photo,
            ),
          );
        }).toList(),
      ),
    );
  }
}