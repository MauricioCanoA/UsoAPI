import 'package:flutter/material.dart';

class DetailError extends StatelessWidget {
  const DetailError({Key? key, this.error}) : super(key: key);
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error ?? 'Error al cargar datos'),
      ),
    );
  }
}