import 'package:flutter/material.dart';
import 'package:bmi/widgets/leftbar.dart';
import 'package:bmi/widgets/rightbar.dart';
import 'package:bmi/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult =0;
  String _textResult = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainHex,
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: accentHex, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHex),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Height',
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8))),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHex),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Weight',
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8))),
                    keyboardType: TextInputType.number,
                  ),
                ),


              ],
            ),
            GestureDetector(
              onTap: (){
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if(_bmiResult > 25){
                    _textResult = "You are over weight";
                  }
                  else if (_bmiResult >= 18.5 && _bmiResult <= 25){
                    _textResult = "You have normal weight";
                  }
                  else{
                    _textResult = 'You are under weight';
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Text('Calculate', style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold, color: accentHex
                ),),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(_bmiResult.toStringAsFixed(2), style: TextStyle(
                  fontSize: 90,  color: accentHex
              ),),
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(_textResult, style: TextStyle(
                    fontSize: 30,  color: accentHex, fontWeight: FontWeight.w400
                ),),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            LeftBar(barWidth: 80),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            RightBar(barWidth: 80),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            RightBar(barWidth: 80)
          ],
        ),
      ),
    );
  }
}
