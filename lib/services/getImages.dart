import 'package:http/http.dart';
import 'dart:convert';
import 'package:unsplash/utils/unsplash_key.dart';
import 'package:unsplash/services/imageData.dart';

Future<List<ImageData>> getPhotos(String collection) async {

  String url = 'https://api.unsplash.com/collections/$collection/photos/?client_id=' + Access_key;
  List<ImageData> images = [];
  // Get response from API
  Response response = await get(url);
  if (response.statusCode == 200) {
    List data = jsonDecode(response.body);
    for (int i = 0; i < data.length; i++) {
        String url = data[i]['urls']['small'];
        String desc = data[i]['description'];
        if (desc == null)
          desc = '';
        images.add(ImageData(url,desc));
      }
  }
  else
    print('error');
  return images;

}