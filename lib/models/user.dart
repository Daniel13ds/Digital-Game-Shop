import 'dart:convert';

import 'package:digital_game_shop/models/userCredential.dart';
import 'package:flutter/material.dart';

class User extends UserCredential {
  String id;
  String avatar;
  String name;
  String lastname;
  String username;
  String email;
  String password;

  User({
    this.id,
    this.avatar,
    this.name,
    this.lastname,
    this.username,
    this.email,
    this.password,
  })
   : super(username: username, password: password);

     get fullName {
    return "$name $lastname";
  }
  

  String toJson() {
    final loginData = {
      "id": id,
      "avatar": avatar,
      "name": name,
      "lastname": lastname,
      "username": username,
      "email": email,
      "password": password,
    };
    return json.encode(loginData);
  }

  static User fromJson(String userJson) {
    final userMap = jsonDecode(userJson);
    return User(
        id: userMap['id'],
        avatar: userMap['avatar'],
        name: userMap['name'],
        lastname: userMap['lastname'],
        username: userMap['username'],
        email: userMap['email'],
        password: userMap['password']);
  }
}
