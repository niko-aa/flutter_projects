import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterFormPage extends StatefulWidget {
  @override
  _RegisterFormPageState createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePass = true;
  final _keyForm = GlobalKey<FormState>();
  final _keyScaffold = GlobalKey<ScaffoldState>();

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  List<String> _countries = [
    'Romania',
    'France',
    'Italy',
    'Germany',
    'USA',
    'Moldova'
  ];

  String _countrySelected;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  void _fieldChangeFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    // var map = map;
    return Scaffold(
      key: _keyScaffold,
      appBar: AppBar(
        title: Text('Form Register Page'),
        centerTitle: true,
      ),
      body: Form(
        key: _keyForm,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_) {
                _fieldChangeFocus(context, _nameFocus, _phoneFocus);
              },
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name: *',
                hintText: 'Introdu numele si prenumele',
                prefixIcon: Icon(Icons.person),
                suffixIcon: GestureDetector(
                    onTap: () {
                      _nameController.clear();
                    },
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0)),
              ),
              validator: _nameValidate,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              focusNode: _phoneFocus,
              onFieldSubmitted: (_) {
                _fieldChangeFocus(context, _phoneFocus, _passFocus);
              },
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone: *',
                hintText: 'Introdu numarul de telefon',
                helperText: 'Format numar de telefon (XXX) XXX-XXXX',
                prefixIcon: Icon(Icons.phone),
                suffixIcon: GestureDetector(
                    onTap: () {
                      _phoneController.clear();
                    },
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0)),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                //FilteringTextInputFormatter.digitsOnly
                FilteringTextInputFormatter(RegExp(r'^[()\d-]{1,15}$'),
                    allow: true),
              ],
              validator: (value) => _phoneValidate(value)
                  ? null
                  : 'Introduceti numarul de telefon in formatul (XXX)XXX-XXXX',
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'email Adress: *',
                  hintText: 'Intoduceti adresa email',
                  icon: Icon(Icons.email)),
              keyboardType: TextInputType.emailAddress,
              validator: _emailValidate,
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
              dropdownColor: Colors.blue[50],
              focusColor: Colors.grey,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                icon: Icon(Icons.map),
                labelText: 'Alege tara de origine *',
              ),
              items: _countries.map((country) {
                return DropdownMenuItem(
                  child: Text(country),
                  value: country,
                );
              }).toList(),
              onChanged: (data) {
                print(data);
                setState(() {
                  _countrySelected = data;
                });
              },
              value: _countrySelected,
              validator: (val) {
                return val == null ? 'Nu ati ales nici o tara' : null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _storyController,
              decoration: InputDecoration(
                labelText: 'Story:',
                hintText: 'Aici puteti introduce o scurta autobiografie',
                helperText: '* va rugam sa va incadrati in 160 de caractere',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              inputFormatters: [
                LengthLimitingTextInputFormatter(160),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              focusNode: _passFocus,
              controller: _passController,
              obscureText: _hidePass,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: 'Password: *',
                hintText: 'Introduceti parola',
                suffixIcon: IconButton(
                  icon:
                      Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                ),
                icon: Icon(Icons.security),
              ),
              validator: _passValidate,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _confirmPassController,
              obscureText: _hidePass,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: 'Confirm Password: *',
                hintText: 'Confirmati parola',
                icon: Icon(Icons.border_color),
              ),
              validator: _passValidate,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                child: Text(
                  'Submit Form',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_keyForm.currentState.validate()) {
      _showDialog(name: _nameController.text);
      print('Name: ${_nameController.text}');
      print('Phone: ${_phoneController.text}');
      print('email: ${_emailController.text}');
      print('County: $_countrySelected');
      print('Story: ${_storyController.text}');
    } else {
      _showMessage(
          message:
              'Formular complectat incorect :( Va rugam sa revizuiti datele introduse');
    }
  }

  String _nameValidate(String value) {
    final _nameExp = RegExp(r'^[A-Za-z]+$');
    if (value.isEmpty) {
      return 'Name - cimp obligatoriu';
    } else if (!_nameExp.hasMatch(value)) {
      return 'Introduceti un nume ce contine caractere alfabetice';
    } else {
      return null;
    }
  }

  bool _phoneValidate(input) {
    final _phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
    return _phoneExp.hasMatch(input);
  }

  String _emailValidate(String value) {
    if (value.isEmpty) {
      return 'email cimp obligatoriu';
    } else if (!_emailController.text.contains('@')) {
      return 'Nu corespunde unei adrese email';
    } else {
      return null;
    }
  }

  String _passValidate(String value) {
    if (_passController.text.length != 10) {
      return 'Parola e nesar sa contina 10 simboluri';
    } else if (_passController.text != _confirmPassController.text) {
      return 'Parola si confirmarea parolei difera';
    } else {
      return null;
    }
  }

  void _showMessage({String message}) {
    _keyScaffold.currentState.showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red[200],
        content: Text(
          message,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        )));
  }

  void _showDialog({String name}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Utilizator adaugat cu succes!',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            content: Text(
              'Felicitari $name ati fost verificat si adaugat cu succes!',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Verificat!',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ))
            ],
          );
        });
  }
}
