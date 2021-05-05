import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[400],
        appBar: AppBar(
          backgroundColor: Colors.red[300],
          title: Text(
            'Meteo',
            style: TextStyle(
                color: Colors.yellow[100],
                fontSize: 25,
                fontWeight: FontWeight.w100),
          ),
          centerTitle: true,
        ),
        body: _bodyContent(),
      ),
    );
  }
}

Widget _bodyContent() {
  return SingleChildScrollView(
    padding: EdgeInsets.all(16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _textField(),
        Divider(),
        _cityDetail(),
        Divider(),
        _temperDetail(),
        SizedBox(height: 30.0),
        Divider(),
        _extraWeatherDetail(),
        Divider(),
        SizedBox(
          height: 25.0,
        ),
        _textDt(),
        // _bottomWeatherDetail(),
        BodyListView(),
      ],
    ),
  );
}

Row _textField() {
  return Row(
    children: <Widget>[
      Icon(Icons.search),
      SizedBox(
        width: 16.0,
      ),
      Text(
        'Intoduceti localitatea dorita',
        style: TextStyle(
            color: Colors.lightGreenAccent[100],
            fontWeight: FontWeight.w100,
            fontSize: 18),
      ),
    ],
  );
}

Column _cityDetail() {
  return Column(
    children: <Widget>[
      Text(
        'Balti, 3100',
        style: TextStyle(
            color: Colors.white, fontSize: 55, fontWeight: FontWeight.w100),
      ),
      Text(
        'Miercuri, 4 Aprilie 2021',
        style: TextStyle(color: Colors.yellow[200], fontSize: 15),
      ),
    ],
  );
}

Widget _temperDetail() {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Container(
      height: 130.0,
      width: 300.0,
      child: ListView(
        padding: EdgeInsets.all(8.0),
        itemExtent: 100,
        children: [
          ListTile(
            title: Text(
              '+3°C',
              style: TextStyle(
                  color: Colors.yellow[100],
                  fontSize: 60,
                  fontWeight: FontWeight.w100),
            ),
            subtitle: Text(
              'Lapovita si vint',
              style: TextStyle(
                  color: Colors.yellow[200],
                  fontSize: 20,
                  fontWeight: FontWeight.w100),
            ),
            leading: Icon(
              Icons.wb_sunny,
              size: 80,
              color: Colors.white,
            ),
          ),
        ],
      ),
    )
  ]);
}

Row _extraWeatherDetail() {
  return Row(
    //crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Column(
        children: <Widget>[
          Icon(Icons.ac_unit, size: 40, color: Colors.white),
          Text(
            '5',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            'km/h',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      Column(
        children: <Widget>[
          Icon(Icons.ac_unit, size: 40, color: Colors.white),
          Text(
            '8',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            '%',
            style: TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      ),
      Column(
        children: <Widget>[
          Icon(Icons.ac_unit, size: 40, color: Colors.white),
          Text(
            '18',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            '%',
            style: TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      )
    ],
  );
}

Column _textDt() {
  return Column(
    children: <Widget>[
      Text(
        'Timpul probabil pentru urmatoarele 7 zile',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w100),
      ),
    ],
  );
}

class BodyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _bottomWeatherDetail();
  }
}

Widget _bottomWeatherDetail() {
  final weekdays = {
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  };
  return Container(
      height: 120,
      child: ListView.builder(
          padding: EdgeInsets.all(6.0),
          scrollDirection: Axis.horizontal,
          itemExtent: 190,
          itemCount: weekdays.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                color: Colors.redAccent[100],
                child: ListTile(
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${weekdays.elementAt(index)}',
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontWeight: FontWeight.w300,
                                fontSize: 25),
                          ),
                        ]),
                    subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 70.0,
                          ),
                          Text(
                            '+${20 + index} °C ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 25),
                          ),
                          Icon(Icons.wb_sunny,
                              color: Colors.yellowAccent, size: 30)
                        ])));
          }));
}
