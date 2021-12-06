import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/screens/items/detail_appbar.dart';
import 'package:pokedex/screens/items/detail_list.dart';
import 'package:pokedex/screens/items/details_pokemon.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {Key? key,
      required this.pokemon,
      required this.list,
      required this.onBack})
      : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        DetailAppBar(
          pokemon: pokemon,
          onBack: onBack,
        ),
        DetailList(
          pokemon: pokemon,
          list: list,
        ),
        DetailsPokemon(
          pokemon: pokemon
        )
      ]),
    );
  }
}
