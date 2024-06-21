// ignore_for_file: avoid_print

import 'dart:convert' ;
import 'package:app_pokemon/pokemonDetail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  List<Map<String, dynamic>> pokedex = [];

  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width ;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: 100,
            left: 20,
            child: Text('Pokedex',
            style: TextStyle(fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black
            ),
            )
            ),
          Positioned(
            top: -30,
            right: -30,
            child: Image.asset('images/pokeball.png',
            width: 200,
            fit: BoxFit.fitWidth,
            ),
            ),
          Positioned(
          top: 150,
          bottom: 0,
          width: width,
          child: Column(
            children: [
              if (pokedex.isNotEmpty) Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.4,
                        ),
                        itemCount: pokedex.length,
                        itemBuilder: (context, index) {
                          var type = pokedex[index]['type'][0];
                          return InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12.0),
                              child: Container(
                                decoration:  BoxDecoration(
                                  color: type == 'Grass' ? Colors.greenAccent 
                                       : type == 'Fire' ? Colors.redAccent 
                                       : type == 'Water' ? Colors.blueAccent
                                       : type == 'Electric' ? Colors.yellowAccent
                                       : type == 'Rock' ? Colors.grey
                                       : type == 'Ground' ? Colors.brown
                                       : type == 'Psychic' ? Colors.indigo
                                       : type == 'Fighting' ? Colors.orangeAccent
                                       : type == 'Bug' ? Colors.lightGreenAccent
                                       : type == 'Ghost' ? Colors.deepPurpleAccent
                                       : type == 'Normal' ? Colors.black26
                                       : type == 'Poison' ? Colors.purpleAccent
                                       : type == 'Dragon' ? const Color.fromARGB(255, 187, 16, 4)
                                       : type == 'Ice' ? const Color.fromARGB(255, 154, 214, 242)
                                       : Colors.pinkAccent ,
                                  borderRadius: const BorderRadius.all(Radius.circular(20))
                              
                                ),
                                child: Stack(
                                  children: [
                                     Positioned(
                                      bottom: -10,
                                      right: -10,
                                      child: Image.asset("images/pokeball.png",
                                      height: 100,
                                      fit: BoxFit.fitHeight,)),
                                    Positioned(
                                      top: 20,
                                      left: 20,
                                      child: Text(
                                        pokedex[index]['name'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white),
                                      ),
                                    ),
                                    Positioned(
                                      top: 45,
                                      left: 20,
                                      child:  Container(
                                        
                                        decoration: const BoxDecoration(
                                          borderRadius:BorderRadius.all(Radius.circular(20)),
                                          color: Colors.black26,
                                        ),
                                        
                                        child: Padding(
                                          padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 4.0,bottom: 4.0),
                                          child: Text(
                                            type.toString(),
                                            style: const TextStyle(
                                              color: Colors.white
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: Hero(
                                        tag: index,
                                        child: CachedNetworkImage(imageUrl: pokedex[index]['img'],
                                        height: 100,
                                        fit: BoxFit.fitHeight,),
                                      ),
                                      ),
                                  ]
                                ),
                              ),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) =>  PokemonDetailScreen(
                                pokemonDetail: pokedex[index],
                                color: type == 'Grass' ? Colors.greenAccent 
                                       : type == 'Fire' ? Colors.redAccent 
                                       : type == 'Water' ? Colors.blueAccent
                                       : type == 'Electric' ? Colors.yellowAccent
                                       : type == 'Rock' ? Colors.grey
                                       : type == 'Ground' ? Colors.brown
                                       : type == 'Psychic' ? Colors.indigo
                                       : type == 'Fighting' ? Colors.orangeAccent
                                       : type == 'Bug' ? Colors.lightGreenAccent
                                       : type == 'Ghost' ? Colors.deepPurpleAccent
                                       : type == 'Normal' ? Colors.black26
                                       : type == 'Poison' ? Colors.purpleAccent
                                       : type == 'Dragon' ? const Color.fromARGB(255, 187, 16, 4)
                                       : type == 'Ice' ? const Color.fromARGB(255, 154, 214, 242)
                                       : Colors.pinkAccent ,
                                heroTag: index,
                              )));
                              // navigate to detail pokemon
                            },
                          );
                        },
                      ),
                    ) else const Center(
                      child: CircularProgressIndicator(),
                    )
            ],
          ),
        ),
        ],
      ),
    );
  }

  void fetchPokemonData() {
    var url = Uri.https(
        "raw.githubusercontent.com", "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        if (decodedJsonData.containsKey('pokemon')) {
          pokedex = List<Map<String, dynamic>>.from(decodedJsonData['pokemon']);
          setState(() {});
        } else {
          // Handle the case where 'pokemon' key is not found in the response
          print('Error: Pokemon data format is incorrect.');
        }
      } else {
        // Handle the case where the server did not return a 200 OK response
        print('Error: Failed to fetch Pokemon data. Status code ${value.statusCode}');
      }
    }).catchError((error) {
      // Handle other errors, such as network errors
      print('Error: $error');
    });
  }
}
