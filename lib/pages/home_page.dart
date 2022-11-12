import 'package:flutter/material.dart';
import 'package:project/pages/currency_page.dart';
import 'package:project/pages/time_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CONVERTER')),
      body: Center(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(160.0)),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => CurrencyPage()));
            }, child: Icon(Icons.currency_exchange,
                color: Colors.white,
                size: 40.0,),
            ),
            Padding(padding: const EdgeInsets.all(20.0)),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => TimePage()));
                }, child: Icon(Icons.access_time,
            color: Colors.white,
            size: 40.0,),
            ),
          ],
        ),
      ),
    );
  }
}
