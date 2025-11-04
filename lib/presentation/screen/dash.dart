import 'package:flutter/material.dart';
import 'package:parcial3/presentation/screen/crearGasto.dart';
import 'package:parcial3/presentation/screen/home.dart';

class Dash extends StatelessWidget {
  const Dash({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context)=> Home(),
        '/crearGastos': (context)=> crearGasto()
      },
    );
  }
}