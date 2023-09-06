import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  //const ResultPage({super.key});
  ResultPage({super.key,required this.height,required this.weight,required this.age});
  late double height;
  late int weight;
  late int age;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late double bmi = (widget.weight/widget.height/widget.height)*10000;

  late List bmiStatus =["","",Colors.white] ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bmiStatus = get_bmi_class(bmi);
  }
  List get_bmi_class(bmi){
    if(bmi<18.5)
      return ["Underweight","Below 18.5 is underweight",Colors.red];
    else if(bmi<24.9)
      return ["Normal","Between 18.5 and 24.9 is healthy",Colors.green];
    else if(bmi<29.9)
      return ["Overweight","Between 25 and 29.9 is overweight",Colors.orangeAccent];
    else if(bmi<34.9)
      return ["Obesity Class I","of 30 or over is obese, increased risk",Colors.red];
    else if(bmi<39.9)
      return ["Obesity Class II","At increased risk",Colors.red];
    else if(bmi>40)
      return ["Obesity Class III","At high risk",Colors.red];
    return ["","",Colors.white];
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(11, 14, 33, 1),
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(11, 14, 33, 1),
          title: Text("BMI CALCULATOR"),
          centerTitle: true),
      bottomNavigationBar: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape:
              ContinuousRectangleBorder(borderRadius: BorderRadius.zero),
              minimumSize: const Size.fromHeight(65),
              backgroundColor: Color.fromRGBO(217, 53, 88, 1)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BmiCalc()));
          },
          child: Text(
            "Re-Calculate",
            style: TextStyle(fontSize: 22),
          )),

      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25,bottom: 5),
            child: Center(child: Text("Your Result",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.w700),)),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Color.fromRGBO(29, 30, 48, 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 60,),
                  Text(bmiStatus[0],style: TextStyle(color: bmiStatus[2],fontSize: 24),),
                  Text(bmi.toStringAsFixed(2),style: TextStyle(color: Colors.white,fontSize: 72),),
                  Text(bmiStatus[1],style: TextStyle(color: Colors.grey,fontSize: 18),),
                  SizedBox(height: 60,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
