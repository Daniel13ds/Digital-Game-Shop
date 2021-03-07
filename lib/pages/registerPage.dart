import 'dart:convert';

import 'package:digital_game_shop/models/user.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static final String route = "/register";
  // Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  UserCredential userCredential;
  bool _showPassword = false;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _error = false;
  User _user = User();
  // RegisterResponse registerResponse =
  //  RegisterResponse.UnknownError("Error desconocido");

  _register() async {}

  onChangeField(String value) {
    setState(() {
      _error = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register user'),
      ),
      //   drawer: NotesDrawer(),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.app_registration,
                      size: 100,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(70)),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person_outline),
                title: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Name"),
                  // onSaved: (newValue) => _user.firstname = newValue,
                  onChanged: onChangeField,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Lastname"),
                  // onSaved: (newValue) => _user.lastname = newValue,
                  onChanged: onChangeField,
                ),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Email"),
                  onSaved: (newValue) => userCredential.email = newValue,
                  onChanged: onChangeField,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person_outline),
                title: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Username"),
                  // onSaved: (newValue) => _user.firstname = newValue,
                  onChanged: onChangeField,
                ),
              ),
              ListTile(
                leading: Icon(Icons.security),
                title: TextFormField(
                  onSaved: (newValue) => userCredential.password = newValue,
                  onChanged: onChangeField,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: IconButton(
                          icon: Icon(_showPassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          })),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                      child: Text("Register user"), onPressed: _register),
                  RaisedButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  Function(String) onChangeField;
  UserCredential userCredential;
  LoginWidget({this.onChangeField, this.userCredential});

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.email),
          title: TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(hintText: "Email"),
            onSaved: (newValue) => widget.userCredential.email = newValue,
            onChanged: widget.onChangeField,
          ),
        ),
        ListTile(
          leading: Icon(Icons.security),
          title: TextFormField(
            onSaved: (newValue) => widget.userCredential.password = newValue,
            onChanged: widget.onChangeField,
            obscureText: !_showPassword,
            decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: IconButton(
                    icon: Icon(_showPassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    })),
          ),
        )
      ],
    );
  }
}

class UserCredential {
  String email;
  String password;

  UserCredential({@required this.email, this.password});

  String toJson() {
    final loginData = {"email": email, "password": password};
    return json.encode(loginData);
  }
}
