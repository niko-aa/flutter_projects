import 'package:flutter/material.dart';
import 'package:flutter_application_return_data_from_second/al_doilea_ecran.dart';

class PrimulEcran extends StatefulWidget {
  @override
  _PrimulEcran createState() => _PrimulEcran();
}

class _PrimulEcran extends State<PrimulEcran> {
  String text = 'Text implicit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primul Ecran'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 35,
                  fontWeight: FontWeight.w100),
            ),
            ElevatedButton(
                onPressed: () {
                  _textreintorspeprima(context);
                },
                child: Text('Next >'))
          ],
        ),
      ),
    );
  }

  void _textreintorspeprima(BuildContext context) async {
    Route route = MaterialPageRoute(builder: (context) => EcranulDoi());
    final result = await Navigator.push(context, route);
    setState(() {
      text = result;
    });
  }
}
