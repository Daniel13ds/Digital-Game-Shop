import 'package:digital_game_shop/models/game.dart';
import 'package:digital_game_shop/services/gamesApiService.dart';
import 'package:scoped_model/scoped_model.dart';

class ShopGamesModel extends Model {
  GamesApiService api;

  ShopGamesModel() {
    api = GamesApiService('1');
  }

  Future<List<Game>> get games {
    return api.getGames();
  }

  Future<void> refresh() async => notifyListeners();
}
