import 'package:flutter/material.dart';

class DetailLoading extends StatelessWidget {
  const DetailLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}