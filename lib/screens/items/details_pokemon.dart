import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class DetailsPokemon extends StatelessWidget {
  const DetailsPokemon({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 256,
      left: 0,
      right: 0,
      height: 500,
      child: Container(
        decoration:BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://store-images.s-microsoft.com/image/apps.30578.13510798887208230.276c1de4-840a-460c-a979-16753ef8691f.f6c2f280-82e5-44e0-b3b0-127b713fcef1"),
              fit: BoxFit.fitHeight
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            margin: EdgeInsets.all(15),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Height:', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30)),
                  Text(pokemon.height, style: TextStyle(fontSize: 20)),
                  Text('Weight:', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30)),
                  Text(pokemon.weight, style: TextStyle(fontSize: 20)),
                  Text('Main Weakness:', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30)),
                  Text(pokemon.weaknesses[0], style: TextStyle(fontSize: 20)),
                  Text('Spawn Chance:', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30)),
                  Text(pokemon.spawnChance.toString(), style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ),
        ),
      ) 
    );
  }
}