import 'dart:convert';
import 'package:appfood/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({super.key});

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  Future<Weather> fetchWeather() async {
    final resp = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=mersin&appid=98846597b15357b3a3ad9b0c2ef5e68f"));

    if (resp.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(resp.body);

      return Weather.fromJson(json);
    } else {
      throw Exception('Error getting weather...');
    }
  }

  late Future<Weather> myWeather;

  @override
  void initState() {
    
    super.initState();
    myWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 45, 104, 153), 
      body:SingleChildScrollView(
        child:Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 30.0,
        ),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white.withOpacity(0.5),
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            Stack(
              children: [
                SafeArea(
                  top: true,
                  child: Column(
                    children: [
                      FutureBuilder<Weather>(
                        future: myWeather,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data!.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  snapshot.data!.weather[0]['main'].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    letterSpacing: 1.3,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Today',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  height: 250,
                                  width: 250,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                      'images/wheather.jpg',
                                    ),
                                  )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          'The Heat',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${((snapshot.data!.main['temp'] - 32 * 5) / 9).toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          'Wind Speed',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${snapshot.data!.wind['speed']} km/h',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          'Humidity',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${snapshot.data!.main['humidity']}%',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return const Text('Error getting weather...');
                          } else {
                            return const CircularProgressIndicator(
                              color: Colors.white,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      ),

    );
  }
}