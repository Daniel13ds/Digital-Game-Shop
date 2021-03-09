import 'package:jwt_decoder/jwt_decoder.dart';

abstract class ApiService {
  static final baseUrl = 'http://192.168.1.41:6060'; //Daniel's Home
  //static final baseUrl = 'http://192.168.1.138:6060'; //Jp's Home

  String token;

  ApiService(this.token);

  String getUserIdFromToken() {
    final mapJwt = JwtDecoder.decode(token);
    return mapJwt['_id'];
  }
}
