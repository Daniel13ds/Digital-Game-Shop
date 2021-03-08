import 'dart:convert';

import 'package:digital_game_shop/models/user.dart';
import 'package:digital_game_shop/models/userCredential.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:http/http.dart' as http;

import 'apiService.dart';


class AuthApiService extends ApiService {
  AuthApiService({token}) : super(token);

  Future<String> login(UserCredential credential) async {
    final response = await http.post(ApiService.baseUrl + "/users/login",
        headers: {"Content-type": "application/json"},
        body: credential.toJson());
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      token = body['token'];
      return token;
    }
  }

  Future<User> register(User user) async {

      final response = await http.post("${ApiService.baseUrl}/users/register",
          headers: {"Content-type": "application/json"}, body: user.toJson());
      if (response.statusCode == 201) {
        final body = json.decode(response.body);
        token = body['token'];
        
      } 
      
    }
  


  bool IsTokenValid() {
    return !JwtDecoder.isExpired(token);
  }

  Future<User> getUser() async {
    final idUser = getUserIdFromToken();
    final response = await http.get("${ApiService.baseUrl}/users/$idUser",
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    }
  }
}
