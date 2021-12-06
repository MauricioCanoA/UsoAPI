import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart'; 
import 'package:pokedex/screens/details/detail_container.dart';
import 'package:pokedex/screens/items/pokemon_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.list, required this.onItemTap}) : super(key: key);
  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:Text('Pokedex'),
      ),
      body: Container(
        decoration:BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://i.pinimg.com/736x/ea/1d/5b/ea1d5bb4dc48f7bf0ac30e8596687be7--minimalist-wallpaper-nintendo.jpg"),
              fit: BoxFit.cover  
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: list.map((e) => PokemonItem(pokemon: e,onTap: onItemTap)).toList(),
          ),
        ),
      ),
    );
  }
}
