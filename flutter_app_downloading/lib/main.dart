import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(Downloading());


class Downloading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DownState();
  }
}
class _DownState extends State<Downloading>{
  bool _loading;
  double _progressValue;

  @override
  void initState() {
    _loading =true;
    _progressValue=0.0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.indigo,
          appBar: AppBar(
            title: Text(
              "Download app",
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Container(
              padding: EdgeInsets.all(16),
              child: _loading ?
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  LinearProgressIndicator(value: _progressValue),
                  Text("${(_progressValue*100).round()}%", style: TextStyle(color: Colors.white, fontSize: 20),),
               ]
              )
             : Text("Press Button to download",style: TextStyle(color: Colors.white, fontSize: 20),),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              setState(() {
                _loading =! _loading;
                _updateProgress();
              });
           },
            child: Icon(Icons.cloud_download),
          ),
          ),
    );
      }
    void _updateProgress(){
        const oneSec = Duration(seconds: 1);
        Timer.periodic(oneSec, (Timer t ){
          setState(() {
            _progressValue +=0.2;
            if (_progressValue.toStringAsFixed(1) == '1.0'){
              _loading=false;
              t.cancel();
              _progressValue=0.0;
              return;
            }
          });
        } );
  }
  }
