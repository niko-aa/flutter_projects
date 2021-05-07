import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_form/model/user.dart';

class UserInfoPage extends StatelessWidget {
  User userInfo;
  UserInfoPage({this.userInfo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'User Info Page',
            style: TextStyle(
                color: Colors.green, fontSize: 20, fontWeight: FontWeight.w300),
          ),
        ),
        body: Card(
          child: Column(
            children: [
              Visibility(
                  visible: userInfo.name == null ? false : true,
                  child: ListTile(
                    title: Text(
                      '${userInfo.name}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    subtitle: Text(
                        userInfo.story != null ? '${userInfo.story}' : null),
                    leading: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    trailing: Text('${userInfo.country}'),
                  )),
              ListTile(
                title: Text(
                  '${userInfo.phone}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                leading: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
              ),
              Visibility(
                  visible: userInfo.email == null ? false : true,
                  child: ListTile(
                    title: Text(
                      '${userInfo.email}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    leading: Icon(
                      userInfo.email == null ? Icons.email : null,
                      color: Colors.black,
                    ),
                  ))
            ],
          ),
        ));
  }
}
