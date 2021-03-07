import 'dart:convert';

import 'package:flutter/material.dart';

class UserCredential {
  String username;
  String password;

  UserCredential({@required this.username, this.password});

  String toJson() {
    final loginData = {"username": username, "password": password};
    return json.encode(loginData);
  }
}