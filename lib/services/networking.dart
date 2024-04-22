import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/screens/loading_screen.dart';

class NetworkHelper {
  NetworkHelper({required this.url});

  final String url;

  Future getData()async{
    // get method is defined inside the http package and takes url as input and returns the future response
    // that's why we have used the Response data type to store the value in response variable
    //also as it gives the future instance that's why we have used the await and async
    http.Response response = await http.get(
      Uri.parse(
          url),
    );
    // check if the response code of fetched data is 200, then it will execute it otheriwse the show the error status code
    if (response.statusCode == 200) {
      String data = response.body;
  return jsonDecode(data);
  }
  else {
      print(response.statusCode);
    }
}
}