import 'package:digital_game_shop/models/preferences.dart';
import 'package:digital_game_shop/models/reward.dart';
import 'package:digital_game_shop/pages/userGames.dart';
import 'package:digital_game_shop/services/rewardsApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RewardInfo extends StatelessWidget {
  static final route = '/rewardInfo';
  Reward reward;
  Preferences _preferences = Preferences();
  RewardsApiService api;

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context).settings.arguments;
    reward = arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Reward Info"),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, UserGames.route, (route) => false),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Image.network(reward.icon),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
                  child: Text(reward.name,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, right: 10, left: 10, bottom: 30),
                  child: Text(
                    reward.description,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text('The ' +
                    reward.globalStatistic.toString() +
                    '% of the users have this achievment'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
