import 'package:http/http.dart' as http;
import 'package:digital_game_shop/models/game.dart';
import 'package:digital_game_shop/services/apiService.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class GamesApiService extends ApiService {
  GamesApiService(token) : super(token);

  Future<List<Game>> getMyGames() async {
    final response = await http.get(ApiService.baseUrl + '/games',
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      final mapJwt = JwtDecoder.decode(token);
      final userId = getUserIdFromToken();
      return Game.myGamesFromJson(response.body, userId);
    }
  }

  Future<List<Game>> getGames() async {
    final response = await http.get(ApiService.baseUrl + '/games');
    if (response.statusCode == 200) {
      return Game.gamesFromJson(response.body);
    }
  }
}
