import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/converter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const labelList = [
    'THB to USD',
    'USD to THB',
    'THB to EUR',
    'EUR to THB',
    'THB to CNY',
    'CNY to THB',
    'THB to JPY',
    'JPY to THB',
    'THB to HKD',
    'HKD to THB',
    'THB to KRW',
    'KRW to THB'
  ];
  var _feedbackText = '';
  final _controller = TextEditingController();

  void _handleClickButton(int i){
    var input = _controller.text;
    if (input == '') {
      setState(() {
        _feedbackText = 'Please enter the number.';
      });
      return;
    }
    var currency = double.tryParse(input);
    if(currency == null) {
      setState(() {
        _feedbackText = 'ERROR. Please try agian.';
      });
      return;
    }

    switch (i){
      case 0:
        //THB to USD
        setState(() {
          _feedbackText = '$currency BAHT = ${Converter.THB2USD(currency)} USD';
        });
        break;

      case 1:
        //USD to THB
        setState(() {
          _feedbackText = '$currency USD = ${Converter.USD2THB(currency)} BAHT';
        });
        break;

      case 2:
        //THB to EUR
        setState(() {
          _feedbackText = '$currency BAHT = ${Converter.THB2EUR(currency)} EURO';
        });
        break;

      case 3:
        //EUR to THB
        setState(() {
          _feedbackText = '$currency EURO = ${Converter.EUR2THB(currency)} BAHT';
        });
        break;

      case 4:
        //THB to CNY
        setState(() {
          _feedbackText = '$currency BAHT = ${Converter.THB2CNY(currency)} YUAN';
        });
        break;

      case 5:
        //CNY 2 THB
        setState(() {
          _feedbackText = '$currency YUAN = ${Converter.CNY2THB(currency)} BAHT';
        });
        break;

      case 6:
        //THB 2 JPY
        setState(() {
          _feedbackText = '$currency BAHT = ${Converter.THB2JPY(currency)} YEN';
        });
        break;

      case 7:
        //JPY 2 THB
        setState(() {
          _feedbackText = '$currency YEN = ${Converter.JPY2THB(currency)} BAHT';
        });
        break;

      case 8:
        //THB 2 HKD
        setState(() {
          _feedbackText = '$currency BAHT = ${Converter.THB2HKD(currency)} HKD';
        });
        break;

      case 9:
        //HKD 2 THB
        setState(() {
          _feedbackText = '$currency HKD = ${Converter.HKD2THB(currency)} BAHT';
        });
        break;

      case 10:
        //THB 2 KRW
        setState(() {
          _feedbackText = '$currency BAHT = ${Converter.THB2KRW(currency)} WON';
        });
        break;

      case 11:
        //KRW 2 THB
        setState(() {
          _feedbackText = '$currency WON = ${Converter.KRW2THB(currency)} BAHT';
        });
        break;
    }
  }

  Widget _buildButton(int i){
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            _handleClickButton(i);
          },
          child: Text(labelList[i]),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    var myList = [
      ['THB to USD', 'USD to THB'],
      ['THB to EUR', 'EUR to THB'],
      ['THB to CNY', 'CNY to THB'],
      ['THB to JPY', 'JPY to THB'],
      ['THB to HKD', 'HKD to THB'],
      ['THB to KRW', 'KRW to THB'],
    ];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/banner.jpg', height: 250.0,),
            Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.1),
                border: Border.all(
                  width: 5.0,
                  color: Colors.deepPurple.shade200,
                ),
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]
              ),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _controller,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    _buildButton(0),
                    _buildButton(1),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    _buildButton(2),
                    _buildButton(3),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    _buildButton(4),
                    _buildButton(5),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    _buildButton(6),
                    _buildButton(7),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    _buildButton(8),
                    _buildButton(9),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    _buildButton(10),
                    _buildButton(11),
                  ]),
                ],
              ),
            ),
            Text(
              _feedbackText,
              style: GoogleFonts.sarabun(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
