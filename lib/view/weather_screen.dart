import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:original_app_weather/model/weather_detail_model.dart';

import '../controller/api_manager.dart';
import 'cities_screen.dart';
import 'components/widgets.dart'; //packjage for date time

class WeatherScreen extends StatefulWidget {
  final pipeline;
  WeatherScreen([this.pipeline]);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    getTime();
    getWeather();
    super.initState();
  }

  var date1;

  Welcome? selectedWeather;

  getWeather() async {
    var data1 =
        await ApiManager.getWeatherByCity('${widget.pipeline ?? 'Lahore'}');
    selectedWeather = Welcome.fromJson(data1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.only(top: 130, right: 150),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "${tempConverter(selectedWeather!.main!.temp)}°C",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              height: 7,
              thickness: 10,
              color: Colors.yellow,
            ),
            Row(
              children: [
                Icon(Icons.search),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => CityScreen()));
                  },
                  child: Text("My Location"),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(Icons.cloud_off),
                SizedBox(
                  width: 10,
                ),
                Text("Weather Lahore"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(Icons.cloud_circle),
                SizedBox(
                  width: 10,
                ),
                Text("Weather Radar"),
              ],
            ),
            Divider(
              height: 5,
              thickness: 3,
              color: Colors.green,
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Weather & radar",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CityScreen()));
            },
          )
        ],
      ),
      body: selectedWeather == null
          ? SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.pink,
              ))
          : Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "This is the Current Temperature of the City ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  height: size.height * 0.70,
                  width: size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/${imageSelector(selectedWeather!.weather![0].main)}"),
                          fit: BoxFit.contain)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImage(
                          size: size.height * 0.40,
                          url: "",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: "${selectedWeather!.name}",
                              fontSize: 20,
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/5438725.png"),
                                        fit: BoxFit.contain)),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text:
                                  "${tempConverter(selectedWeather!.main!.temp)}°C",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/full-removebg-preview.png"),
                                        fit: BoxFit.contain)),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        date1 == null
                            ? CircularProgressIndicator.adaptive()
                            : CustomText(text: date1),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/5438725.png"))),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/97d6d3d9d7e9f7b041eb22e46ee9a0c0.png"))),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/download.jpg"))),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/5438725.png"))), //
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/5438725.png"))),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/images.png"))),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  tempConverter(temp) {
    return (temp - 273).round();
  }

  imageSelector(image) {
    print(image);
    var finalImage;
    var weatherImage = image.toString().toLowerCase();
    if (weatherImage == "cloud" || weatherImage == "Cloud") {
      finalImage = "cloud.jpg";
    } else if (weatherImage == "haze") {
      finalImage = "haze.jpg";
    } else if (weatherImage == "smoke") {
      finalImage = "smog.jpg";
    } else if (weatherImage == "sunny") {
      finalImage = "sunny.jpg";
    } else {
      finalImage = "Weather.jpg";
    }

    return finalImage;
  }

  // var count = 0;
  Timer? timer;
  getTime() {
    // var date;
    var timer = Timer.periodic(Duration(seconds: 1), (time) {
      date1 = DateFormat("MMM-yyyy-dd hh:mm:ss").format(DateTime.now());
      setState(() {
        // count++;
        //print(date);
      });
    });

    //  return Text("${date}");
  }
}
