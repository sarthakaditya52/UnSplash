import 'package:http/http.dart';
import 'dart:convert';
import 'package:unsplash/utils/unsplash_key.dart';
import 'package:unsplash/services/imageData.dart';

Future<List<ImageData>> getPhotos(String collection, String defaultTitle,int pageNo) async {
  String pNo = pageNo.toString();
  String url = 'https://api.unsplash.com/collections/$collection/photos/?page=' + pNo +  '&client_id=' + Access_key;
  List<ImageData> images = [];
  // Get response from API
  Response response = await get(url);
  if (response.statusCode == 200) {
    List data = jsonDecode(response.body);
    for (int i = 0; i < data.length; i++) {
        String url = data[i]['urls']['small'];
        var desc = data[i]['description'];
        if (desc != null) {
          desc = desc.split(' ');
          if(desc.length > 9)
            desc = 'One item - White Background';
          else
            {
              if (desc.length > 1)
                desc = desc[0] + ' ' + desc[1];
              else
                desc = desc[0];
            }

        }
        if (desc == null)
          desc = defaultTitle;
        images.add(ImageData(url,desc));
      }
  }
  else
    print('error');
  return images;

}