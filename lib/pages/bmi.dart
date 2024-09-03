import 'package:flutter/material.dart';
import '../preset/nav.dart';

class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PresetAppBar(),
      drawer: PresetDrawer(),
      
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final double _offsetX = -148.0;
  double? _bmi;
  String? _bmiSol;
  
  void _calculateBMI(){
    final double? height = double.tryParse(_heightController.text);
    final double? weight = double.tryParse(_weightController.text);

    if(height != null && weight != null && height > 0 && weight > 0){
      setState(() {
        _bmi = weight / (height * height / 10000);
      });
    }
    else{
      setState(() {
        _bmi = null;
      });
    }
  }

  void _bmiCheck(){
    _calculateBMI();

    if(_bmi != null){
      setState(() {
        if(_bmi! < 16){
          _bmiSol = 'Severly Underweight';
        }
        else if(_bmi! < 18.5){
          _bmiSol = 'Underweight';
        }
        else if(_bmi! < 25){
          _bmiSol = 'Normal';
        }
        else if(_bmi! < 30){
          _bmiSol = 'Overweight';
        }
        else if(_bmi! < 35){
          _bmiSol = 'Moderately Obese';
        }
        else if(_bmi! < 40){
          _bmiSol = 'Severely Obese';
        }
        else{
          _bmiSol = 'Morbidly Obese';
        }
      });
    }
    else{
      setState(() {
        _bmiSol = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            // Title 'BMI Calculator'
            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'BMI Calculator',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(97, 97, 97, 1),
                    fontWeight: FontWeight.bold
                    ),
                ),
              ),
            ),

            // Height text
            const SizedBox(height: 40),
            Transform.translate(
              offset: Offset(_offsetX, 0),
              child: const Center(
                child: Text(
                  'Height in cm',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(97, 97, 97, 1),
                  ),
                ),
              ),
            ),

            // Height input box
            Center(
              child: SizedBox(
                width: 400,
                child: TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ex. 160',
                    filled: true,
                    fillColor: const Color.fromRGBO(224, 224, 224, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              )
            ),

            // Weight text
            const SizedBox(height: 20),
            Transform.translate(
              offset: Offset(_offsetX, 0),
              child: const Center(
                child: Text(
                  'Weight in kg',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(97, 97, 97, 1),
                  ),
                ),
              ),
            ),

            // Weight input box
            Center(
              child: SizedBox(
                width: 400,
                child: TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ex. 60',
                    filled: true,
                    fillColor: const Color.fromRGBO(224, 224, 224, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              )
            ),

            // Calculate button
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: _bmiCheck,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(36, 49, 223, 1),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Calculate')),
              ),

            // BMI Number text
            const SizedBox(height: 40),
            if(_bmi != null)
              Center(
                child: Text(
                  'Your BMI  :  ${_bmi!.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(1, 190, 98, 1),
                    ),
                ),
              ),

          // BMI Type text
          const SizedBox(height: 20),
          if(_bmi != null)
            Center(
              child: Text(
                'Your BMI Type  :  $_bmiSol',
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(248, 49, 50, 1),
                  ),
              )
            )

          ],
        ),
      ),
    );
  }
}
