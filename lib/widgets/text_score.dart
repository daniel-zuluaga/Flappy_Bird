import 'package:flutter/material.dart';

class TextScore extends StatelessWidget {

  final String textName;
  final String textNumber;


  const TextScore({
    super.key, 
    required this.textName, 
    required this.textNumber
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        
        const SizedBox(
          height: 20,
        ),

        Text(
          textNumber,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ]
    );
  }
}