import 'package:digital_game_shop/models/game.dart';
import 'package:digital_game_shop/models/preferences.dart';
import 'package:digital_game_shop/models/reward.dart';
import 'package:digital_game_shop/models/shopGamesModel.dart';
import 'package:digital_game_shop/services/rewardsApiService.dart';
import 'package:scoped_model/scoped_model.dart';

class RewardsModel extends ShopGamesModel {
  Game game;
  RewardsApiService rewardApi;
  Preferences _preferences = Preferences();

  RewardsModel(Game game) {
    rewardApi = RewardsApiService(_preferences.token);
    this.game = game;
  }

  Future<List<Reward>> get rewards {
    return rewardApi.getRewards(game);
  }

  Future<void> refresh() async => notifyListeners();
}
