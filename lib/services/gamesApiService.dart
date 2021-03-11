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

  Future<Game> updateGame(Game game) async {
    final response = await http.put(ApiService.baseUrl + "/games/${game.id}",
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: game.toJson());
    if (response.statusCode == 201) {
      return Game.fromJson(response.body);
    }
  }

  Future<Game> buyGame(Game game) async {
    final idUser = getUserIdFromToken();
    if (game.userId.contains(idUser)) {
      return game;
    } else {
      game.userId.add(idUser);
      final response = await http.put(ApiService.baseUrl + "/games/${game.id}",
          headers: {
            "Content-type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: game.toJson());
      if (response.statusCode == 201) {
        return Game.fromJson(response.body);
      }
    }
  }

  Future<Game> sellGame(Game game) async {
    final idUser = getUserIdFromToken();
    game.userId.remove(idUser);
    final response = await http.put(ApiService.baseUrl + "/games/${game.id}",
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: game.toJson());
    if (response.statusCode == 201) {
      return Game.fromJson(response.body);
    }
  }

  Future<Game> addGame(Game game) async {
    final response = await http.post(ApiService.baseUrl + '/games',
        headers: {
          "Content-type": "application/json",
          "Authorization": "$token"
        },
        body: game.toJson());
    if (response.statusCode == 201) return Game.fromJson(response.body);
  }

  Future<bool> removeGame(Game game) async {
    try {
      final response = await http.delete(
          ApiService.baseUrl + '/games/${game.id}',
          headers: {"Authorization": "$token"});
      if (response.statusCode == 200)
        return true;
      else
        return false;
    } catch (error) {
      return false;
    }
  }
}
