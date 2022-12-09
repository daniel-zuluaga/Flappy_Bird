import 'package:flappy_bird_flutter/models/barriers.dart';
import 'package:flutter/material.dart';

class ObstacleBarriers extends StatelessWidget {

  final double barrierXOne;
  final double barrierXTwo;
  final double barrierXThree;
  final double barrierXFour;


  ObstacleBarriers({super.key, 
    required this.barrierXOne, 
    required this.barrierXTwo, 
    required this.barrierXThree, 
    required this.barrierXFour
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          alignment: Alignment(barrierXOne,-1.05),
          duration: const Duration(milliseconds: 0),
          child: const MyBarriers(
            size: 250,
          ),
        ),
        AnimatedContainer(
          alignment: Alignment(barrierXOne,1.05),
          duration: const Duration(milliseconds: 0),
          child: const MyBarriers(
            size: 250,
          ),
        ),
        AnimatedContainer(
          alignment: Alignment(barrierXTwo,-1.05),
          duration: const Duration(milliseconds: 0),
          child: const MyBarriers(
            size: 360,
          ),
        ),
        AnimatedContainer(
          alignment: Alignment(barrierXTwo,1.05),
          duration: const Duration(milliseconds: 0),
          child: const MyBarriers(
            size: 120,
          ),
        ),
        AnimatedContainer(
          alignment: Alignment(barrierXThree,-1.05),
          duration: const Duration(milliseconds: 0),
          child: const MyBarriers(
            size: 130,
          ),
        ),
        AnimatedContainer(
          alignment: Alignment(barrierXThree,1.05),
          duration: const Duration(milliseconds: 0),
          child: const MyBarriers(
            size: 360,
          ),
        ),
        AnimatedContainer(
          alignment: Alignment(barrierXFour,-1.05),
          duration: const Duration(milliseconds: 0),
          child: const MyBarriers(
            size: 80,
          ),
        ),
        AnimatedContainer(
          alignment: Alignment(barrierXFour,1.05),
          duration: const Duration(milliseconds: 0),
          child: const MyBarriers(
            size: 400,
          ),
        )
      ],
    );
  }
}
