import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/screens/details/detail_error.dart';
import 'package:pokedex/screens/details/detail_loading.dart';
import 'package:pokedex/screens/details/detail_screen.dart';
import 'package:pokedex/settings/errors.dart';
import 'package:pokedex/settings/pokemon_conn.dart';

class DetailArguments {
  DetailArguments({this.index = 0,required this.pokemon});
  final Pokemon pokemon;
  final int? index;
}

class DetailContainer extends StatefulWidget {
  const DetailContainer(
      {Key? key,
      required this.conn,
      required this.arguments,
      required this.onBack})
      : super(key: key);
  final IPokemonConn conn;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  _DetailContainerState createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: widget.conn.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return DetailLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return DetailScreen(
            pokemon: widget.arguments.pokemon,
            list: snapshot.data!,
            onBack: widget.onBack,
          );
        }

        if (snapshot.hasError) {
          return DetailError(error: (snapshot.error as Failure).message!);
        }

        return Container();
      },
    );
  }
}
