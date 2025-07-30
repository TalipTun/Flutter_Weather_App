import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:flutter_dotenv/flutter_dotenv.dart";
import 'dart:convert';

Future main() async {
  await dotenv.load(fileName: "lib/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final latitudeController = TextEditingController();
  final longtitudeController = TextEditingController();
  @override
  void dispose() {
    latitudeController.dispose();
    longtitudeController.dispose();
    super.dispose();
  }

  String data = "";
  String weatherCondition = "no data";
  double temperature = 0.0;
  double feelsLike = 0.0;
  int humidity = 0;
  double windSpeed = 0.0;
  int visibility = 0;

  void getData() async {
    String latitude = latitudeController.text;
    String longtitude = longtitudeController.text;
    String? api_key = dotenv.env["API_KEY"];

    try {
      final response = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longtitude&appid=$api_key&units=metric",
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(response.body);
        setState(() {
          weatherCondition = decodedData['weather'][0]['main'];
          temperature = decodedData['main']['temp'];
          feelsLike = decodedData['main']['feels_like'];
          humidity = decodedData['main']['humidity'];
          windSpeed = decodedData['wind']['speed'];
          visibility = decodedData['visibility'];
        });
      } else {
        setState(() {
          data = "Failed to load data. Status code: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        data = "Error $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        backgroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              "If you don't know your details, you can learn it here: https://www.latlong.net/",
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Latitude',
                ),
                controller: latitudeController,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Longtitude',
                ),
                controller: longtitudeController,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: getData,
              child: const Text("Get Weather"),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Temperature: $temperature"),
                      Text("Feels like: $feelsLike"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Condition: $weatherCondition"),
                      Text("Humidity: $humidity"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Wind: $windSpeed"),
                      Text("Visibility: $visibility"),
                    ],
                  ),
                ],
              ),
            ),
            Text(data),
          ],
        ),
      ),
    );
  }
}
