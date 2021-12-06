import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/settings/api_const.dart';
import 'package:pokedex/settings/errors.dart';

abstract class IPokemonConn {
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonConn implements IPokemonConn {
  final Dio dio;
  PokemonConn({required this.dio});

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(ApiConst.allPokemonsURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failure(message:'Error al cargar los datos');
    }
  }
}
