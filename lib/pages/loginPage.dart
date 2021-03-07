import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import 'registerPage.dart';



class LoginPage extends StatefulWidget {
  static final route = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _error = false;
    UserCredential _credentials = UserCredential();


  _login() async {

  }

  onChangeField(String value) {
    setState(() {
      _error = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
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
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.person,
                      size: 100,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(70)),
                ),
              ),
              LoginWidget(
                  onChangeField: onChangeField, userCredential: _credentials),
              if (_error)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Usuario o contraseña incorrecta",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                      child: Text("Login"),
                      onPressed: () {
                        _login();
                      }),
                  RaisedButton(
                      child: Text("Register"),
                      onPressed: () {
                       Navigator.pushNamed(context, Register.route);
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


class UserCredential {
  String email;
  String password;

  UserCredential({@required this.email, this.password});

  String toJson() {
    final loginData = {"email": email, "password": password};
    return json.encode(loginData);
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
          leading: Icon(Icons.person),
          title: TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(hintText: "Username"),
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
