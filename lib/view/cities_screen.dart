import 'package:flutter/material.dart';

import 'weather_screen.dart';

class CityScreen extends StatelessWidget {
  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text("Search Any City You Want"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter any city", border: OutlineInputBorder()),
              controller: cityController,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                 if(cityController.text.isNotEmpty){
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => WeatherScreen(cityController.text)));
                 }
                },
                child: Text("Search Weather"))
          ],
        ),
      ),
    );
  }
}
