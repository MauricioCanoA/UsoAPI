import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class DetailList extends StatelessWidget {
  const DetailList({Key? key, required this.pokemon,  required this.list}) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 56,
      left: 0,
      right: 0,
      height: 200,
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    pokemon.num,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: PageView(
                children:
                  list.map((e) => Image.network(pokemon.image)).toList()
              )
            )
          ],
        ),
      ),
    );
  }
}
