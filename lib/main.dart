import 'package:flutter/material.dart';
import 'package:lojavirtual/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutters Cloathing',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          //Cor botão, cor da barra e diversas partes
          primaryColor: Color.fromARGB(255, 4, 125, 141),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
