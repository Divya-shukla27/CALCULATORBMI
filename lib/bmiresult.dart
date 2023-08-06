import 'dart:ffi';

import 'package:flutter/material.dart';
class bmiresult extends StatelessWidget{
  double bmi;
  String rr(double bmi){
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
  String interpret(double bmi){
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. Try to focus on your diet.';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Column(
        children: [

          Container(
            margin: EdgeInsets.fromLTRB(250, 150, 90, 80),
            child: SizedBox(
                height: 150.0,
                width:double.infinity,
                child: Text('YOUR RESULT',style:TextStyle(fontSize:100.0,color: Colors.white,fontWeight: FontWeight.bold ),)),
          ),
              Container(
                margin: EdgeInsets.fromLTRB(70, 0, 70, 0),
                padding: EdgeInsets.fromLTRB(0, 300, 0, 10),
                alignment: Alignment.center,
                height: 1150.0,
                width: double.infinity,
                color: Colors.grey[850],
                child: Column(
                  children:[
                  Text(bmi.toStringAsFixed(2),style: TextStyle(fontSize: 155.0,color: Colors.white70),),
                    SizedBox(
                      height: 60.0,
                    ),
                    Text(rr(bmi),style: TextStyle(fontSize: 90.0,color:Colors.green,),),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(interpret(bmi),style:TextStyle(fontSize: 50.0,color: Colors.white70),textAlign: TextAlign.center,)
                  ],
                ),
              ),

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70.0,
        width: double.infinity,
        margin: EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green, // Background color
          ),
          child: Text(
            'RE-CALCULATE',
            style: TextStyle(fontSize:40),
          ),
        ),
      ),
    );
  }
  bmiresult({required this.bmi});
}