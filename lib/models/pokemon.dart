import 'package:flutter/material.dart';

class Pokemon {
  final String name;
  final String image;
  final List<String> type;
  final int id;
  final String num;
  final String height;
  final String weight;
  final dynamic spawnChance;
  final List<String> weaknesses;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
        name: json['name'],
        image: json['img'],
        id: json['id'],
        type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
        num: json['num'],
        height: json['height'],
        weight: json['weight'],
        spawnChance: json['spawn_chance'],
        weaknesses: (json['weaknesses'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  Color? get baseColor => color(type: type[0]);

  Pokemon({
    required this.name,
    required this.image,
    required this.type,
    required this.id,
    required this.num,
    required this.height, 
    required this.weight, 
    required this.spawnChance, 
    required this.weaknesses 
  });

  static Color? color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}
