import 'package:flutter/material.dart';

class BirdsModel extends StatelessWidget {
  const BirdsModel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Image.asset(
        "assets/images/flappy_bird2.png"
      ),
    );
  }
}