import 'package:flutter/material.dart';

void main() => runApp(CounterWidget());

class CounterWidget extends StatefulWidget {
  @override
  _CounterStateWidget createState() => _CounterStateWidget();
}

class _CounterStateWidget extends State<CounterWidget>{
  int _count;
  @override
  void initState() {
    _count=50;
    super.initState();
  }

  void _incrementCount (){
    setState(() {
      _count++;
    });

  }
  void _decrementCount(){
    setState(() {
      _count--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text('Counter', style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'IndieFlower',),
            textDirection: TextDirection.ltr,
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Tap "-" to decrement', style: TextStyle(fontSize: 20, color: Colors.white),),
                Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
                  width: 120,
                  height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(icon: const Icon(Icons.remove_circle_rounded), onPressed: _decrementCount),
                    Text('$_count', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
                    IconButton(icon: const Icon(Icons.add_box_rounded), onPressed: _incrementCount)],
                ),
                ),
          Text('Tap "+" to increment', style: TextStyle(fontSize: 20, color: Colors.white),),
              ],
                ),
            ),

          ),



    );
  }

}
