import 'package:digital_game_shop/models/game.dart';
import 'package:digital_game_shop/models/preferences.dart';
import 'package:digital_game_shop/pages/userGames.dart';
import 'package:digital_game_shop/services/gamesApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gameRewards.dart';

class UserGameInfo extends StatelessWidget {
  static final route = '/userGameInfo';
  Game game;
  Preferences _preferences = Preferences();
  GamesApiService api;

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context).settings.arguments;
    game = arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Info"),
        actions: [
          IconButton(
            icon: Icon(Icons.emoji_events),
            onPressed: () => Navigator.pushNamed(context, GameRewards.route,
                arguments: game),
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, UserGames.route, (route) => false),
          ),
        ],
      ),
      body: ListView(
        children: [
          Image.network(game.logo),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Text(
                  game.title,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Distributed by " + game.distributor,
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 200, 200, 200)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    "Release date: " + game.date,
                    style: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 200, 200, 200)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    "Progreso: " + game.progress.toString(),
                    style: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 200, 200, 200)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    "Puntuación personal: " + game.personalScore.toString(),
                    style: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 200, 200, 200)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
                  child: Text(
                    game.description,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
