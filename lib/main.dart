import 'dart:ffi';

import 'package:bmicalculator/bmiresult.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(home: bmi(),));
class bmi extends StatefulWidget{
  @override
  State<bmi> createState() => _bmiState();
}
class _bmiState extends State<bmi>{
  int weigh=45;
  int ag=20;
  int _value=40;
  double bmi=0.0;
  double Calculatebmi(int weigh, int _value){
    double heightinm=_value/100.0;
    double bmi = weigh / (heightinm * heightinm);
    return bmi;
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title:Text("BMI CALCULATOR"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation:0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height:150.0,
              width: 100.0,
            ),
          Row(
            children: <Widget>[
              Expanded(
                flex:2,
                child: SizedBox(
                  height: 290.0,
                  width:200.0,
                  child: ElevatedButton.icon(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[850],// Background color
                    ),
                    label: Text("Male",style: TextStyle(
                      fontSize: 34.0,
                    ),),
                    icon: Icon(Icons.male,size: 190.0,),
                  )
                ),
              ),
              SizedBox(
                height:290.0,
                width: 100.0,
              ),
              Expanded(
                flex:2,
                child: SizedBox(
                  height: 290.0,
                  width:200.0,
                  child: ElevatedButton.icon(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[850], // Background color
                    ),
                      label: Text("Female",style: TextStyle(fontSize: 34.0,),),
                    icon: Icon(Icons.female,size:190.0,),
                  ),
                ),
              ),
            ],
          ),
            SizedBox(
              height: 170.0,
              width: 1000.0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              color:Colors.black12,
              height:290.0,
              width:1000.0,
              child: Column(
                children: [
                  Text('Height',
                  style:TextStyle(fontSize:60.0,color: Colors.white),),
                  SizedBox(
                    height:30.0,
                  ),
                  Text('$_value cm',style: TextStyle(fontSize:40.0,color: Colors.white),),
                  SizedBox(
                    height:10.0,
                  ),
                  Slider(
                    min:0.0,
                    max:370,
                    thumbColor: Colors.green,
                    activeColor: Colors.green,
                    inactiveColor: Colors.white70,
                    value:_value.toDouble(),
                    onChanged: (double value){
                      setState((){
                        _value=value.toInt();
                      });
                  },
                  ),
                ],
              ),),
            SizedBox(
              height: 170.0,
              width: 1000.0,
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0,0.0),
                  child: Column(
                    children: [
                      Text('Weight',style:TextStyle(fontSize: 55.0,color: Colors.white),),
                      SizedBox(
                        height:35.0,
                      ),
                      Text('$weigh kg',style: TextStyle(fontSize:40.0,color: Colors.white),),
                      SizedBox(
                        height: 17.0,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 100.0,
                            width: 100.0,
                            child: FloatingActionButton(onPressed:(){setState(() {
                              weigh++;
                            });},backgroundColor: Colors.black38,shape: CircleBorder(),
                              child: const Icon(Icons.add,size: 50.0,),),
                          ),
                          SizedBox(
                            height: 200.0,
                            width:110.0,
                          ),
                          Container(
                            height: 100.0,
                            width: 100.0,
                            child: FloatingActionButton(onPressed: (){setState(() {
                              weigh-=1;
                            });},backgroundColor: Colors.black38,shape: CircleBorder(),
                              child:const Icon(Icons.remove,size:50.0,),),
                          ),
                        ],
                      ),
                      SizedBox(
                        width:410.0,
                      ),
                    ],
                  ),
                  color: Colors.black12,
                ),
                SizedBox(
                  height:240.0,
                  width: 100.0,
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0,0.0),
                      child: Column(
                        children: [
                          Text('Age',style:TextStyle(fontSize: 55.0,color: Colors.white),),
                          SizedBox(
                            height:35.0,
                          ),
                          Text('$ag',style: TextStyle(fontSize:40.0,color: Colors.white),),
                          SizedBox(
                            height: 17.0,
                          ),

                          Row(
                            children: [
                              Container(
                                height: 100.0,
                                width: 100.0,
                                child: FloatingActionButton(onPressed:(){setState(() {
                                  ag++;
                                });},backgroundColor: Colors.black38,shape: CircleBorder(),
                                  child: const Icon(Icons.add,size: 50.0,),),
                              ),
                              SizedBox(
                                height: 200.0,
                                width:110.0,
                              ),
                              Container(
                                width: 100.0,
                                height: 100.0,
                                child: FloatingActionButton(onPressed: (){setState(() {
                                  ag-=1;
                                });},backgroundColor: Colors.black38,
                                  child: const Icon(Icons.remove,size: 50.0,),),
                              ),
                            ],
                          ),
                          SizedBox(
                            width:400.0,
                          ),],
                      ),
                      color: Colors.black12,
                    ),

                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton: Container(
    height: 70.0,
    width: double.infinity,
    margin: EdgeInsets.all(10.0),
    child: ElevatedButton(
    onPressed: () {
      bmi=Calculatebmi(weigh, _value);
      Navigator.push(context,MaterialPageRoute(builder: (context)=> bmiresult(
        bmi:bmi,
      )));
    },
    style: ElevatedButton.styleFrom(
    primary: Colors.green, // Background color
    ),
    child: Text(
    'CALCULATE',
    style: TextStyle(fontSize:40),
    ),
    ),
),  );
  }
}