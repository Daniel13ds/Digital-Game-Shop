import 'package:digital_game_shop/models/shopGamesModel.dart';
import 'package:digital_game_shop/pages/gameRewards.dart';
import 'package:digital_game_shop/pages/loginPage.dart';
import 'package:digital_game_shop/pages/registerPage.dart';
import 'package:digital_game_shop/pages/rewardInfo.dart';
import 'package:digital_game_shop/pages/shopGameInfo.dart';
import 'package:digital_game_shop/pages/shopGames.dart';
import 'package:digital_game_shop/pages/userGameInfo.dart';
import 'package:digital_game_shop/pages/userGames.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MyApp extends StatelessWidget {
  ShopGamesModel shopGamesModel;

  @override
  Widget build(BuildContext context) {
    shopGamesModel = ShopGamesModel();
    return ScopedModel(
      model: shopGamesModel,
      child: ScopedModelDescendant<ShopGamesModel>(
        builder: (context, child, model) {
          var initialRoute = LoginPage.route;
          if(shopGamesModel.tokenIsValid()) initialRoute=UserGames.route;
          return MaterialApp(
            title: 'Digital Game Shop',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                brightness: Brightness.dark,
                primaryColor: Colors.orange,
                buttonColor: Colors.green),
            routes: {
              LoginPage.route: (context) => LoginPage(),
              RegisterPage.route: (context) => RegisterPage(),
              UserGames.route: (context) => UserGames(),
              UserGameInfo.route: (context) => UserGameInfo(),
              GameRewards.route: (context) => GameRewards(),
              RewardInfo.route: (context) => RewardInfo(),
              ShopGames.route: (context) => ShopGames(),
              ShopGameInfo.route: (context) => ShopGameInfo(),
            },
            initialRoute: initialRoute,
          );
        },
      ),
    );
  }
}
