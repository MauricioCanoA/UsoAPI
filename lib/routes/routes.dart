import 'package:flutter/material.dart';
import 'package:pokedex/screens/details/detail_container.dart';
import 'package:pokedex/screens/home_container.dart';
import 'package:pokedex/settings/pokemon_conn.dart';

class Routes extends StatelessWidget {
  const Routes({Key? key, required this.conn}) : super(key: key);
  final PokemonConn conn;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/'){
          return MaterialPageRoute(
            builder: (context) {
            return HomeContainer(
                conn: conn,
                onItemTap: (route, arguments) {
                  Navigator.of(context).pushNamed(route, arguments: arguments);
                });
          });
        }
        
        if (settings.name == '/details'){
          return MaterialPageRoute(
            builder: (context) {
            return DetailContainer(
              conn: conn,
              arguments: (settings.arguments as DetailArguments),
              onBack:() => Navigator.of(context).pop(),
            );
          });
        }  
      },
    );
  }
}
