import 'package:flutter/material.dart';
import 'dart:js';
import 'package:practica/services/mockapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 84, 231, 170)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MockApi _mockApi = MockApi();
  String resultblu = '';
  String resultoAm = '';
  String resultrojo = '';
  //tiempo asignado
  Duration animati1 = Duration(seconds: 2);
  Duration animati2 = Duration(seconds: 4);
  Duration animati3 = Duration(seconds: 9);

  double containerW1 = 0.0;
  double containerW2 = 0.0;
  double containerW3 = 0.0;

  void onPressedGreen() async {
    setState(() {
      containerW1 = 100.0;
    });

    final result = await _mockApi.getFerrariInteger();

    setState(() {
      containerW1 = 0.0;
      resultblu = '$result';
    });
  }

  void onPressedOrange() async {
    setState(() {
      containerW2 = 100.0;
    });

    final result = await _mockApi.getHyundaiInteger();

    setState(() {
      containerW2 = 0.0;
      resultoAm = '$result';
    });
  }

  void onPressedRed() async {
    setState(() {
      containerW3 = 100.0;
    });

    final result = await _mockApi.getFisherPriceInteger();

    setState(() {
      containerW3 = 0.0;
      resultrojo = '$result';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 20, 158, 228),
        title: const Text('Animacion--1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //boton 1
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                onPressed: onPressedGreen,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 3, 255, 11))),
                child: SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Center(
                      child:
                          Icon(Icons.skip_next_rounded, color: Colors.black26)),
                ),
              ),
            ),
            AnimatedContainer(
                duration: animati1, //// Tiempo de animacion
                width: containerW1,
                height: 10.0,
                color: Color.fromARGB(255, 24, 55, 197)),
            Text(
              resultblu,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //boton 2
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                onPressed: onPressedOrange,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 211, 247, 7))),
                child: SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child:
                      Center(child: Icon(Icons.pause, color: Colors.black26)),
                ),
              ),
            ),
            AnimatedContainer(
                duration: animati2, // Tiempo de animacion
                width: containerW2,
                height: 10.0,
                color: Color.fromARGB(255, 190, 238, 17)),
            Text(
              resultoAm,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //boton 3
            Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: ElevatedButton(
                  onPressed: onPressedRed,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 236, 27, 13))),
                  child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: Center(
                        child: Icon(Icons.stop_circle, color: Colors.black26)),
                  ),
                )),
            AnimatedContainer(
                duration: animati3, //// Tiempo de animacion
                width: containerW3,
                height: 10.0,
                color: const Color.fromARGB(255, 216, 23, 9)),
            Text(
              resultrojo,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
