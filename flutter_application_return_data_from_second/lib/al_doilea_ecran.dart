import 'package:flutter/material.dart';

class EcranulDoi extends StatefulWidget {
  @override
  _EcranulDoi createState() => _EcranulDoi();
}

class _EcranulDoi extends State<EcranulDoi> {
  TextEditingController textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecranul Doi'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                decoration: InputDecoration(
                  fillColor: Colors.blue[200],
                ),
                controller: textFieldController,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w100)),
            ElevatedButton(
                onPressed: () {
                  String textReturnat = textFieldController.text;
                  Navigator.pop(context, textReturnat);
                },
                child: Text('< Send Back'))
          ],
        ),
      ),
    );
  }
}
