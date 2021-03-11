import 'package:digital_game_shop/models/game.dart';
import 'package:digital_game_shop/models/preferences.dart';
import 'package:digital_game_shop/models/userCredential.dart';
import 'package:digital_game_shop/services/AuthApiService.dart';
import 'package:digital_game_shop/services/gamesApiService.dart';
import 'package:scoped_model/scoped_model.dart';

import 'user.dart';

class ShopGamesModel extends Model {
  User user;
  GamesApiService api;
  AuthApiService authApi;
  Preferences _preferences = Preferences();
  bool logged = false;

  ShopGamesModel() {
    if (tokenIsValid()) {
      api = GamesApiService(_preferences.token);
      authApi = AuthApiService(token: _preferences.token);
      getUser();
      logged = true;
    } else {
      authApi = AuthApiService();
    }
  }

  Future<List<Game>> get games {
    return api.getGames();
  }

  Future<List<Game>> get myGames {
    return api.getMyGames();
  }

  Future<void> refresh() async => notifyListeners();

  Future<void> register(User user) async {
    authApi.register(user);
  }

  bool _setLoginStatus(String token) {
    if (token != null) {
      logged = true;
      _preferences.token = token;
      api = GamesApiService(token);
      getUser();
    } else {
      logged = false;
      _preferences.token = null;
    }
    return logged;
  }

  Future<bool> login(UserCredential credential) async {
    final token = await authApi.login(credential);
    return _setLoginStatus(token);
  }

  bool tokenIsValid() {
    final token = _preferences.token;
    if (token != null && token != "") {
      return AuthApiService(token: token).IsTokenValid();
    } else {
      return false;
    }
  }

  getUser() async {
    user = await authApi.getUser();
  }

  logout() {
    logged = false;
    _preferences.token = null;
  }

  set token(String token) {
    _preferences.token = token;
    api = GamesApiService(token);
    authApi = AuthApiService(token: token);
  }

  addGame(Game game) async {
    await api.addGame(game);
    notifyListeners();
  }

  removeGame(Game game) async {
    await api.removeGame(game);
    notifyListeners();
  }

  updateGame(Game game) async {
    await api.updateGame(game);
    notifyListeners();
  }

  sellGame(Game game) async {
    await api.sellGame(game);
    notifyListeners();
  }
}
