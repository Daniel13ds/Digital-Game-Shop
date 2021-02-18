import 'package:digital_game_shop/pages/userGames.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Game Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.orange,
          buttonColor: Colors.green),
      routes: {
        //Login.route: (context) => Login(),
        //Register.route: (context) => Register(),
        UserGames.route: (context) => UserGames(),
        //UserGameInfo.route: (context) => UserGameInfo(),
        //Achievements.route: (context) => Achievements(),
        //AchievementInfo.route: (context) => AchievementInfo(),
        //ShopGames.route: (context) => ShopGames(),
        //ShopGameInfo.route: (context) => ShopGameInfo(),
      },
      initialRoute: UserGames.route,
    );
  }
}
