import 'dart:async';

import 'package:flappy_bird_flutter/models/birds.dart';
import 'package:flappy_bird_flutter/widgets/obtacle_barriers.dart';
import 'package:flappy_bird_flutter/widgets/text_score.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static double birdYAxis = 0;
  double time = 0;
  double height = 0; 
  double initialHeight = birdYAxis;
  bool gameHasStarted = false;
  static double barrierXOne = 1;
  static double barrierXTwo = barrierXOne + 2;
  static double barrierXThree = barrierXTwo + 2;
  double barrierXFour = barrierXThree + 2;

  int score = 0;
  int bestScore = 0;
  bool birdIsDead = false;


  void jump(){
    setState(() {
      time = 0;
      initialHeight = birdYAxis;
    });
  }

  void startGame(){
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 60), (timer) { 
      time += 0.03;
      height = -4.9 * time * time + 2.5 * time;
      setState(() {
        birdYAxis = initialHeight - height;
      });

      setState(() {
        if(barrierXOne < -1.7){
          barrierXOne = barrierXFour + 2;
        }
        else{
          barrierXOne -= 0.05;
        }
      });
      setState(() {
        if(barrierXTwo < -1.7){
          barrierXTwo = barrierXOne + 2;
        }
        else{
          barrierXTwo -= 0.05;
        }
      });
      setState(() {
        if(barrierXThree < -1.7){
          barrierXThree = barrierXTwo + 2;
        }
        else{
          barrierXThree -= 0.05;
        }
      });
      setState(() {
        if(barrierXFour < -1.7){
          barrierXFour = barrierXThree + 2;
        }
        else{
          barrierXFour -= 0.05;
        }
      });

      if(_birdIsDead()){
        timer.cancel();
        gameHasStarted = false;
      }
    });
  }

  bool _birdIsDead(){
    if(birdYAxis > 1 || birdYAxis > -1){
      return true;
    }
    return false;
  }

  void showDialogGameOver(){
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.brown,
          title: const Center(
            child: Text(
              "G A M E   O V E R ! ! ! :(",
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          content: Text(
            "Score: $score",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
          ),
          actions: [
            TextButton(
              onPressed: (){
                if(score > bestScore){
                  bestScore = score;
                }
                initState();
                setState(() {
                  gameHasStarted = false;
                });
                Navigator.of(context).pop();
              }, 
              child: const Text(
                "PLAY  AGAIN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
                ),
              )
            )
          ],
        );
      }
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [ 
                  AnimatedContainer(
                    color: Colors.lightBlue,
                    alignment: Alignment(0,birdYAxis),
                    duration: const Duration(
                      milliseconds: 0
                    ),
                    child: const BirdsModel(),
                  ),
                  Container(
                    alignment: const Alignment(0, -0.35),
                    child: gameHasStarted 
                        ? const Text("")
                        : const Text(
                      "T A P  T O  P L A Y",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ObstacleBarriers(
                    barrierXOne: barrierXOne, 
                    barrierXTwo: barrierXTwo, 
                    barrierXThree: barrierXThree, 
                    barrierXFour: barrierXFour,
                  )
                ]
              )
            ),
            Container(
              height: 20,
              color: Colors.green,
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextScore(
                      textName: "SCORE", 
                      textNumber: "$score"
                    ),
                    TextScore(
                      textName: "BEST", 
                      textNumber: "$bestScore"
                    ),
                  ],
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}