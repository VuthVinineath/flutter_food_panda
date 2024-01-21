import 'dart:convert';
import 'dart:io';

import 'package:food_panda6/data/app_exception.dart';
import 'package:http/http.dart' as http;
class ApiService {

  /// MARK : POST RESTAURANT
  Future<dynamic> postRestaurant(url,data) async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(url));
    request.body = data;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
      print(await response.stream.bytesToString());
    }
    else {
      //print(response.reasonPhrase);
      return false;
    }

  }

  /// MARK : UPLOAD IMAGE THROUGH API
  Future<dynamic> uploadImage(image,url) async {
    http.StreamedResponse? response;
    try{
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath('files', image));
      response = await request.send();
      return returnResponse(response);
    }on Exception{
      throw FetchDataException(response!.reasonPhrase);
    }
  }

  Future<dynamic> getApi(url) async{
    http.StreamedResponse? response;
    try{
      var request = http.Request('GET', Uri.parse(url));
      response = await request.send();
      return returnResponse(response);
    }on SocketException{
      throw FetchDataException(response!.reasonPhrase.toString());
    }
      // if (response.statusCode == 200) {
      //   print(await response.stream.bytesToString());
      // }
      // else {
      //   print(response.reasonPhrase);
    }

    returnResponse(http.StreamedResponse response) async{
      switch(response.statusCode){
        case 200:
          return await response.stream.bytesToString();
        case 500:
        case 400:
      }
    }
}