import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add assets',
            style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              Image(image: AssetImage(
                'assets/images/as2.jpg'
              ),
              ),
              Image.asset('assets/icons/asi1.png'),
              Positioned(
                top: 345,
                  left: 125,
                  child: Text('My first app', style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower',
                  ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}