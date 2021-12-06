import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/screens/details/detail_container.dart';
import 'package:pokedex/screens/home_error.dart';
import 'package:pokedex/screens/home_loading.dart';
import 'package:pokedex/screens/home_screen.dart';
import 'package:pokedex/settings/errors.dart';
import 'package:pokedex/settings/pokemon_conn.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.conn, required this.onItemTap}) : super(key: key);
  final IPokemonConn conn;
  final Function(String,DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: conn.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HomeLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomeScreen(list: snapshot.data!, onItemTap: onItemTap,);
        }

        if (snapshot.hasError) {
          return HomeError(error: (snapshot.error as Failure).message!);
        }

        return Container();
      },
    );
  }
}
