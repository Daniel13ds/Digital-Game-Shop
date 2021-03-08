import 'dart:convert';

import 'package:digital_game_shop/models/shopGamesModel.dart';
import 'package:digital_game_shop/models/user.dart';
import 'package:digital_game_shop/models/userCredential.dart';
import 'package:digital_game_shop/pages/userGames.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class RegisterPage extends StatefulWidget {
  static final String route = "/registerPage";
  // Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  User userCredential = User();
  bool _showPassword = false;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _error = false;
  //User _user = User();
  // RegisterResponse registerResponse =
  //  RegisterResponse.UnknownError("Error desconocido");

  _register() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print(userCredential.toJson());
      await ScopedModel.of<ShopGamesModel>(context, rebuildOnChange: true)
          .register(userCredential);
      // Navigator.pushNamedAndRemoveUntil(
      //  context, UserGames.route, (route) => false);
      //Navigator.popAndPushNamed(context, UserGames.route);
      Navigator.pop(context);
    } else {
      print("error");
    }
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
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Name"),
                  onSaved: (newValue) => userCredential.name = newValue,
                  onChanged: onChangeField,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Lastname"),
                  onSaved: (newValue) => userCredential.lastname = newValue,
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
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Username"),
                  onSaved: (newValue) => userCredential.username = newValue,
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
