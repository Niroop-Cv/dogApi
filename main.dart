import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/first.dart';
import 'package:quizz_app/justApi.dart';
import 'package:quizz_app/second.dart';
import 'package:quizz_app/timeClock.dart';



void main(){
  runApp(quizz());
}
class quizz extends StatelessWidget {
  const quizz({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:HomeScreen() ,
      home: JustApi(),
    );
  }
}