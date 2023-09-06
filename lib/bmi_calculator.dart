import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';

class BmiCalc extends StatefulWidget {
  const BmiCalc({super.key});

  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

enum Gender { Male, Female }

class _BmiCalcState extends State<BmiCalc> {
  double _height = 165.0;
  int weight = 65;
  int age = 20;
  late Gender selectedGender = Gender.Male;
  //double bmi_value = 0;
  TextEditingController textEditingController=TextEditingController();

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
                  MaterialPageRoute(builder: (context) => ResultPage(height: _height,age: age,weight: weight,)));
            },
            child: Text(
              "Calculate",
              style: TextStyle(fontSize: 22),
            )),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          //highlightColor: Colors.blue.withOpacity(0.4),
                          //splashColor: Colors.green.withOpacity(0.5),

                            onTap: () {
                              setState(() {
                                selectedGender = Gender.Male;
                              });
                            },
                            child: iconContainer(
                                Icons.male,
                                "Male",
                                selectedGender == Gender.Male
                                    ? Colors.green
                                    : Color.fromRGBO(29, 30, 48, 1))),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedGender = Gender.Female;
                              });
                            },
                            child: iconContainer(
                                Icons.female,
                                "Female",
                                selectedGender == Gender.Female
                                    ? Colors.green
                                    : Color.fromRGBO(29, 30, 48, 1))),
                      ),
                    ],
                  )),
              Expanded(
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(29, 30, 48, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Text(
                          "HEIGHT",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(76, 79, 94, 1)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _height.round().toString(),
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "cm",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(76, 79, 94, 1)),
                            ),
                          ],
                        ),
                        Slider(
                          min: 10.0,
                          max: 250.0,
                          value: _height.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              _height = value;
                            });
                          },
                          activeColor: Colors.white,
                          inactiveColor: Color.fromRGBO(140, 142, 154, 1),
                          thumbColor: Color.fromRGBO(217, 53, 88, 1),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: buildContainer("Weight", weight.toString(),textEditingController)),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(child: buildContainer("Age", age.toString(),textEditingController)),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Container iconContainer(IconData icon1, String text1, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),

      //child
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon1, size: 100, color: Colors.white),
          Text(
            text1,
            style:
            TextStyle(fontSize: 18, color: Color.fromRGBO(76, 79, 94, 1)),
          ),
        ],
      ),
    );
  }

  Container buildContainer(String text1, String text2,TextEditingController textEditingController) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(29, 30, 48, 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text1,
            style:
            TextStyle(fontSize: 18, color: Color.fromRGBO(76, 79, 94, 1)),
          ),
          Text(
            text2,
            style: TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.w700),
          ),
       /*   TextField(
            controller: textEditingController,
            onChanged: (newvalue){
              weight=int.parse(newvalue);
            },

          ),*/
          SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () =>
                {
                  setState(() {
                    button_click(text1, "decrement");
                  })
                },
                child: Icon(Icons.remove, size: 20),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(76, 79, 94, 1),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20)),
              ),
              //SizedBox(width: 5,),
              ElevatedButton(
                onPressed: () =>
                {
                  setState(() {
                    button_click(text1, "increment");
                  })
                },
                child: Icon(Icons.add, size: 20),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(76, 79, 94, 1),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20)),
              )
            ],
          )
        ],
      ),
    );
  }

  void button_click(String text1, String operation) {
    if (text1 == "Weight") {
      operation == "increment" ? weight++ : weight--;
      weight = weight < 0 ? 0 : weight;
    }
    else if (text1 == "Age") {
      operation == "increment" ? age++ : age--;
      age = age < 0 ? 0 : age;
    }
  }
}