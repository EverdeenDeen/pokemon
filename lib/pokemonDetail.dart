import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  final dynamic pokemonDetail;
  final Color color;
  final int heroTag;

  const PokemonDetailScreen({
    Key? key,
    required this.pokemonDetail,
    required this.color,
    required this.heroTag,
  }) : super(key: key);

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              widget.pokemonDetail['name'],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Positioned(
            top: height * 0.22,
            right: -30,
            child: Image.asset(
              'images/pokeball.png',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 120,
            left: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                widget.pokemonDetail['type'].join(', '),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            width: width,
            height: height * 0.6,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Container(
                          width: width*0.3,
                          child: const Text("Name",style: TextStyle(
                            color: Colors.blueGrey,fontSize: 18,
                          ),)
                          ),
                          Container(
                          width: width*0.3,
                          child: Text(widget.pokemonDetail['name'],style: TextStyle(
                            color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold
                          ),)
                          ),
                          ],
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Container(
                          width: width*0.3,
                          child: const Text("Height",style: TextStyle(
                            color: Colors.blueGrey,fontSize: 18,
                          ),)
                          ),
                          Container(
                          
                          child: Text(widget.pokemonDetail['height'],style: TextStyle(
                            color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold
                          ),)
                          ),
                          ],
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Container(
                          width: width*0.3,
                          child: const Text("Weight",style: TextStyle(
                            color: Colors.blueGrey,fontSize: 18,
                          ),)
                          ),
                          Container(
                          
                          child: Text(widget.pokemonDetail['weight'],style: TextStyle(
                            color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold
                          ),)
                          ),
                          ],
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Container(
                          width: width*0.3,
                          child: const Text("Spawn Time",style: TextStyle(
                            color: Colors.blueGrey,fontSize: 18,
                          ),)
                          ),
                          Container(
                          
                          child: Text(widget.pokemonDetail['spawn_time'],style: TextStyle(
                            color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold
                          ),)
                          ),
                          ],
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Container(
                          width: width*0.3,
                          child: const Text("Weakness",style: TextStyle(
                            color: Colors.blueGrey,fontSize: 18,
                          ),)
                          ),
                          Container(
                          
                          child: Text(widget.pokemonDetail['weaknesses'].join(","),  style: TextStyle(
                            color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold
                          ),)
                          ),
                          ],
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Container(
                          width: width*0.3,
                          child: const Text("Prev Evolution",style: TextStyle(
                            color: Colors.blueGrey,fontSize: 18,
                          ),)
                          ),
                          widget.pokemonDetail['prev_evolution']!=null?
                          SizedBox(
                            height: 20,
                            width: width*0.55,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.pokemonDetail['prev_evolution'].length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.only(right :8.0),
                                  child: Text(widget.pokemonDetail['prev_evolution'][index]['name'],style: TextStyle(
                            color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold
                          ),),
                                );
                              }
                            ),
                          ):Text('Just Hatched',style: TextStyle(
                            color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold
                          ),)

                          ],
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Container(
                          width: width*0.3,
                          child: const Text("Evolution",style: TextStyle(
                            color: Colors.blueGrey,fontSize: 18,
                          ),)
                          ),
                          widget.pokemonDetail['next_evolution']!=null?
                          SizedBox(
                            height: 20,
                            width: width*0.55,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.pokemonDetail['next_evolution'].length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.only(right :8.0),
                                  child: Text(widget.pokemonDetail['next_evolution'][index]['name'],style: TextStyle(
                            color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold
                          ),),
                                );
                              }
                            ),
                          ):Text('Maxed Out',style: TextStyle(
                            color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold
                          ),)

                          ],
                        ),
                    ),
                    
                      ],
                      
                ),
                
              ),
            ),
          ),
          Positioned(
            top: height * 0.22,
            right: (width / 2) - 100,
              child: Hero(
                tag: widget.heroTag,
                child: CachedNetworkImage(
                  imageUrl: widget.pokemonDetail['img'],
                  height: 200,
                  fit: BoxFit.fitHeight,
                ),
              ),
            
          ),
        ],
      ),
    );
  }
}