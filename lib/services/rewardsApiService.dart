import 'package:digital_game_shop/models/game.dart';
import 'package:http/http.dart' as http;
import 'package:digital_game_shop/models/reward.dart';
import 'package:digital_game_shop/services/apiService.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class RewardsApiService extends ApiService {
  RewardsApiService(token) : super(token);

  Future<List<Reward>> getRewards(Game game) async {
    final response = await http.get(ApiService.baseUrl + '/rewards');
    if (response.statusCode == 200) {
      final mapJwt = JwtDecoder.decode(token);
      final gameId = game.id;
      return Reward.rewardsFromJson(response.body, gameId);
    }
  }
}
