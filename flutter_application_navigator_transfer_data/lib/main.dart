import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PrimaPagina(),
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/':
          return MaterialPageRoute(builder: (context) => PrimaPagina());
          break;
        case '/doua':
          User user = settings.arguments;
          return MaterialPageRoute(
              builder: (context) => PaginaDoua(
                    user: user,
                  ));
          break;
      }
    },
  ));
}

class PrimaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prima Pagina'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              User user = User(name: 'Niko', age: 42);
              Navigator.pushNamed(context, '/doua', arguments: user);
            },
            child: Text('Treci pe dagina a doua')),
      ),
    );
  }
}

class PaginaDoua extends StatelessWidget {
  final User user;
  PaginaDoua({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Utilizator: ${this.user.name} - ${this.user.age} Ani'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Inapoi pe prima'),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;
  User({this.name, this.age});
}
