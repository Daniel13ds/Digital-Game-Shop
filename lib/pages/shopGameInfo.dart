import 'package:digital_game_shop/models/game.dart';
import 'package:digital_game_shop/models/preferences.dart';
import 'package:digital_game_shop/pages/gameRewards.dart';
import 'package:digital_game_shop/services/gamesApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopGameInfo extends StatelessWidget {
  static final route = '/shopGameInfo';
  Game game;
  Preferences _preferences = Preferences();
  GamesApiService api;

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context).settings.arguments;
    game = arguments;
    print(game.toJson());

    return Scaffold(
      appBar: AppBar(
        title: Text("Game Info"),
        actions: [
          IconButton(
            icon: Icon(Icons.emoji_events),
            onPressed: () => Navigator.pushNamed(context, GameRewards.route),
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
      floatingActionButton: Container(
        width: 100,
        height: 100,
        child: FittedBox(
          child: FloatingActionButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Buy for \n" + game.price.toString() + "\$",
                  style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () {}),
        ),
      ),
    );
  }
}
