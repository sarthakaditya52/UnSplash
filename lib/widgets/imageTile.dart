import 'package:flutter/material.dart';
import 'package:unsplash/services/imageData.dart';

class ImageTile extends StatelessWidget {
  ImageTile({
    Key key,
    @required this.photo,
  }) : super(key: key);

  final ImageData photo;

  @override
  Widget build(BuildContext context) {

    return GridTile(
      child: Card(
        elevation: 0.0,
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  photo.image_url,
                  height: 286,
                  fit: BoxFit.cover,
                )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                child: Text(photo.image_desc,style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 10),),
              ),
            ),
          ],
        ),
      ),//image,
    );
  }
}