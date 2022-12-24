import 'dart:convert';

// ignore: depend_on_referenced_packages

import 'package:http/http.dart' as http;
import 'package:original_app_weather/controller/credential.dart';

class ApiManager {
  static const BaseURL = "https://jsonplaceholder.typicode.com";

  static const BaseWeatherURL =
      "https://api.openweathermap.org/data/2.5/weather"; //?q={city name}&appid={API key}

  static getWeatherByCity(city) async {
    var url = "$BaseWeatherURL?q=$city&appid=$ApiKey";

    try {
      var response = await http.get(Uri.parse(url));
      var responseData = jsonDecode(response.body);

      return responseData;
    } catch (e) {
      print(e);
    }
  }
}




//====================
// import 'dart:convert';
// import 'dart:developer';

// import 'package:http/http.dart' as http;

// class Api_show {
//   static const getdataWeath = "https://api.openweathermap.org/data/2.5/weather";
//   // static ApiData() async {
//   //   try {
//   //     var data = await http.get(Uri.parse(
//   //         "https://api.openweathermap.org/data/2.5/weather?q=lahore&appid=60c64f09bc85a6b16593496716c8a069"));

//   //     var response = jsonDecode(data.body);
//   //     return response;
//   //     log(data.body);
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }

//   static getdataWeather(city) async {
//     try {
//       var url = "$getdataWeath?q=$city&appid=60c64f09bc85a6b16593496716c8a069";
//       var response = await http.get(Uri.parse(url));

//       var responseData = jsonDecode(response.body);
//       return responseData;
//     } catch (e) {
//       print(e);
//     }
//   }
// }
