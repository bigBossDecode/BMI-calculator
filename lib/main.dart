import 'package:bmicalculator/widgetHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI Calculator",
      home: const BMIHomePage(),
    );
  }
}

class BMIHomePage extends StatefulWidget {
  const BMIHomePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BMIHomePageState();
}

class _BMIHomePageState extends State<BMIHomePage> {
  String _selectedGender = "MALE";
  double _currentValue = 150;
  int _age = 20;
  int _weight = 55;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black,
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedGender = "MALE";
                        });
                      },
                      child: widgetHelper().CardLayout(
                        text: "MALE",
                        imageUrl: "assets/male.png",
                        cardColor: (_selectedGender == "MALE"
                            ? Colors.lightBlue
                            : Color(0xff121212)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedGender = "FEMALE";
                        });
                      },
                      child: widgetHelper().CardLayout(
                        text: "FEMALE",
                        imageUrl: "assets/female.png",
                        cardColor: (_selectedGender == "FEMALE"
                            ? Colors.lightBlue
                            : Color(0xff121212)),
                      ),
                    ),
                  ],
                ),
                Card(
                  color: Color(0xff121212),
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "HEIGHT",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _currentValue.toInt().toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 30,
                              alignment: Alignment.bottomCenter,
                              child: const Text(
                                "cm",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Slider(
                            value: _currentValue,
                            min: 10,
                            max: 200,
                            divisions: 190,
                            activeColor: Colors.lightBlue,
                            secondaryActiveColor: Colors.lightBlue,
                            inactiveColor: Colors.transparent,
                            thumbColor: Colors.lightBlue,
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                _currentValue = value;
                              });
                            }),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 4.0,
                      color: Color(0xff121212),
                      child: Container(
                        alignment: Alignment.center,
                        width: 135,
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "WEIGHT",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _weight.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: 30,
                                  alignment: Alignment.bottomCenter,
                                  child: const Text(
                                    "kg",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                widgetHelper().CustomButton(onClick: (){
                                  if(_weight<200)
                                  {
                                    setState(() {
                                      ++_weight;
                                    });
                                  }
                                }, icon: Icons.add, ),
                                widgetHelper().CustomButton(onClick: (){
                                  if(_weight>1)
                                  {
                                    setState(() {
                                      --_weight;
                                    });
                                  }
                                }, icon: CupertinoIcons.minus, ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4.0,
                      color: const Color(0xff121212),
                      child: Container(
                        alignment: Alignment.center,
                        width: 135,
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "AGE",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              _age.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                widgetHelper().CustomButton(onClick: (){
                                  if(_age<100)
                                  {
                                    setState(() {
                                      ++_age;
                                    });
                                  }
                                }, icon: Icons.add, ),
                                widgetHelper().CustomButton(onClick: (){
                                  if(_age>1)
                                  {
                                    setState(() {
                                      --_age;
                                    });
                                  }
                                }, icon: CupertinoIcons.minus, ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Card(
                  color:const Color(0xff121212),
                  child: Container(
                    width: width-30,
                    height: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Developed by \"Ajay Raj\"", style: TextStyle(color: Colors.white, fontSize: 20,),),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: () async {
                              try{
                                Uri url = Uri.parse("https://github.com/Ajay-raj-code");
                                await launchUrl(url, mode: LaunchMode.platformDefault);
                              }
                              catch (e){
                                print("Cannot launch url. Error ${e.toString()}");
                              }
                            }, icon: const Image(image: AssetImage("assets/github.png",), width: 25, height: 25,), ),
                            IconButton(onPressed: () async {
                              try{
                                Uri url = Uri.parse("https://github.com/Ajay-raj-code");
                                await launchUrl(url, mode: LaunchMode.platformDefault);
                              }
                              catch (e){
                                print("Cannot launch url. Error ${e.toString()}");
                              }
                            }, icon: const Image(image: AssetImage("assets/linkedin.png",), width: 28, height: 28,), )
                          ],
                        ),
                      ],
                    ),
                  ),
                  ),

                Spacer(),
                InkWell(
                  onTap: () {
                    double calculateResult = calculateBMI(_weight.toDouble(), _currentValue);
                    String message  = detailedBMIClassification(calculateResult,_selectedGender,_age);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff121212),
                                border: Border.all(color: Colors.black, width: 2,),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                              height: 140,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("BMI", style: TextStyle(fontSize: 18, color: Colors.white),),
                                  Text(calculateResult.toString(), style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold,),),
                                  Text(message, style: TextStyle(fontSize: 16, color: Colors.white, fontStyle: FontStyle.italic), maxLines: 2, textAlign: TextAlign.center,)
                                ],
                              ),
                            ),

                        );
                      },
                    );
                  },
                  child: Container(
                    width: width - 10,
                    alignment: Alignment.center,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  double roundToTwoDecimalPlaces(double value) {
    return double.parse(value.toStringAsFixed(2));
  }
  double calculateBMI(double weight, double height){
    double heightMeters = height/100;
    return roundToTwoDecimalPlaces(weight / (heightMeters* heightMeters));
  }
  String detailedBMIClassification(double bmi, String gender, int age) {
    String classification = 'normal weight';

    if (age < 18) {
      return 'Consult a healthcare provider for accurate assessment.';
    }

    if (gender.toLowerCase() == 'male') {
      if (bmi < 18.5) {
        classification = 'underweight';
      } else if (bmi >= 25 && bmi<30) {
        classification = 'overweight';
      } else if (bmi>=30){
        classification = 'Obese';
      }
    } else if (gender.toLowerCase() == 'female') {
      if (bmi < 18.5) {
        classification = 'underweight';
      } else if (bmi >= 24 && bmi<30) {
        classification = 'overweight';
      } else if (bmi>=30){
        classification = 'Obese';
      }

    }

    return 'Based on your BMI of $bmi, you are classified as $classification.';
  }
}
