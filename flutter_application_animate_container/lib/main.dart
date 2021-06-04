import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => StatusProvider())
          ],
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool status = false;

  bool isSwitchOn = false;

  Color _textColor = Colors.black;
  Color _appBarColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
  //Color.fromRGBO(36, 41, 46, 1);
  Color _scaffoldBgcolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    StatusProvider _state = Provider.of<StatusProvider>(context);

    return Theme(
      data: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: _textColor),
          bodyText2: TextStyle(color: _textColor),
        ),
      ),
      //child: MultiProvider(
      //providers: [
      // ChangeNotifierProvider(create: (context) => StatusProvider())
      //],
      child: Scaffold(
        backgroundColor: _scaffoldBgcolor,
        appBar: AppBar(
          backgroundColor: _appBarColor,
          title: Text(
            "FlutterSwitch Demo",
            style: TextStyle(
                color: Colors
                    .primaries[Random().nextInt(Colors.primaries.length)]),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        width: 300,
                        height: 300,
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        alignment: Alignment.center,
                        curve: Curves.fastOutSlowIn,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: FlutterSwitch(
                                width: 55.0,
                                height: 25.0,
                                valueFontSize: 12.0,
                                toggleSize: 18.0,
                                value: _state.statusValue,
                                onToggle: (val) => _state.changeStatus()
                                //{
                                //setState(() {
                                //status = val;
                                // }
                                )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StatusProvider extends ChangeNotifier {
  bool _status = false;
  bool get statusValue => _status;

  void changeStatus() {
    _status = !_status;
    notifyListeners();
  }
}
