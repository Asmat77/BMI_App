import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: Scaffold(
        body: HomePage(),
      ),
    );

  }
}
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}
class _HomePageState extends State<HomePage>{
  TextEditingController ageController=TextEditingController();
  TextEditingController heightController=TextEditingController();
  TextEditingController weightController=TextEditingController();
  String result="";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 50,),

          Stack(
            alignment: Alignment.center,
            children: [
              Image(image: AssetImage("assets/images/heart for bmi.png")),
              Center(child: Text("$result",style: TextStyle(fontSize: 40),))
            ],
          ),

          Text("Healthy",style: TextStyle(fontSize: 30,color: Colors.green),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SizedBox(height: 20,),
                  Text("Male",style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: "standered")),
                  Container(
                    height: 110,
                    width: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/menhealth.png"),scale: .1)
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text("Female",style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: "standered"),),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/female health.png"),scale: .1)
                    ),
                  )
                ],
              )
            ],
          ),

          SizedBox(height:15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("Age",style: TextStyle(color: Colors.black.withOpacity(.7),fontSize:15,fontFamily: "standered" ),),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 50,
                      width: 50,


                      child: TextField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                            border: InputBorder.none
                        ),
                      )
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Height",style: TextStyle(color: Colors.black.withOpacity(.7),fontSize:15 ,fontFamily: "standered" ),),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: TextField(
                      controller: heightController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                        border: InputBorder.none
                        ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Weight",style: TextStyle(color: Colors.black.withOpacity(.7),fontSize:15 ,fontFamily: "standered" ),),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: TextField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          border: InputBorder.none
                        ),
                      ),
                  ),
                ],
              ),
            ],
          ),


          InkWell(
            onTap: (){
              int weight=int.parse(weightController.text);
              int height=int.parse(heightController.text);
              num m_height=height/100;
              num sqm_height=pow(m_height, 2);
              result ="${weight~/sqm_height}";
              setState(() {

              });

            },
            child: Container(
              width: double.infinity,
              height: 50,
              color: Color(0xff88CFC7),
              child: Center(child: Text("Calculate BMI",style: TextStyle(color: Color(0xffffffff),fontFamily: "standered",fontSize: 25),)),
            ),
          ),
        ],
      ),
    );
  }
}