import 'package:flutter/material.dart';

class MyBarriers extends StatelessWidget {

  final double size;

  const MyBarriers({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(
          width: 8, 
          color: Color.fromARGB(255, 2, 130, 15),
        ),
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}
