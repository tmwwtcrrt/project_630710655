import 'package:flutter/material.dart';
import 'package:project/converters/time_converter.dart';
import 'package:google_fonts/google_fonts.dart';

class TimePage extends StatefulWidget {
  const TimePage({Key? key}) : super(key: key);

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  static const TimeList = [
    'H to M',
    'M to H',
    'H to D',
    'D to H',
    'M to D',
    'D to M'
  ];
  var _feedbackText = '';
  final _controller = TextEditingController();

  void _handleClickButton(int i) {
    var input = _controller.text;
    if (input == '') {
      setState(() {
        _feedbackText = 'Please enter the number.';
      });
      return;
    }
    var time = double.tryParse(input);
    if (time == null) {
      setState(() {
        _feedbackText = 'ERROR. Please try agian.';
      });
      return;
    }

    switch (i) {
      case 0:
        setState(() {
          _feedbackText = '$time HOURS = ${TimeConverter.H2M(time)} MINUTES';
        });
        break;
      case 1:
        setState(() {
          _feedbackText = '$time MINUTES = ${TimeConverter.M2H(time)} HOURS';
        });
        break;
      case 2:
        setState(() {
          _feedbackText = '$time HOURS = ${TimeConverter.H2D(time)} DAYS';
        });
        break;
      case 3:
        setState(() {
          _feedbackText = '$time DAYS = ${TimeConverter.D2H(time)} HOURS';
        });
        break;
      case 4:
        setState(() {
          _feedbackText = '$time MINUTES = ${TimeConverter.M2D(time)} DAYS';
        });
        break;
      case 5:
        setState(() {
          _feedbackText = '$time DAYS = ${TimeConverter.D2M(time)} MINUTES';
        });
        break;
    }
  }

  Widget _buildButton(int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          _handleClickButton(i);
        },
        child: Text(TimeList[i]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mylist = [
      ['HOUR to MINUTE', 'MINUTE to HOUR'],
      ['HOUR to DAY', 'DAY to HOUR'],
      ['MINUTE to DAY', 'DAY to MMINUTE'],
    ];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/time.jpg',height: 250.0,),
            Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.orangeAccent.withOpacity(0.1),
                border: Border.all(
                  width: 5.0,
                  color: Colors.deepOrange.shade200,
                ),
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellowAccent.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3)
                  )
                ]
              ),
              child: Column(
                children: [
                  Padding(padding: const EdgeInsets.all(16.0),
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
