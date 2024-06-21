import 'package:app_pokemon/home_screen.dart';
import 'package:flutter/material.dart';

void main () {
  runApp(const Pokedex()) ;
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  HomeScreen(),
    );
  }
}