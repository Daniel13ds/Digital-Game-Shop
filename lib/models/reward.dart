import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reward {
  String id;
  String icon;
  String name;
  String description;
  String difficulty;
  bool earned;
  double globalStatistic;
  String gameId;

  Reward(
      {this.id,
      @required this.icon = 'URL',
      @required this.name,
      @required this.description,
      @required this.difficulty,
      @required this.earned = false,
      @required this.globalStatistic = 0,
      @required this.gameId});

  static Reward fromMap(Map<String, dynamic> reward) => Reward(
      id: reward['id'],
      icon: reward['icon'],
      name: reward['name'],
      description: reward['description'],
      difficulty: reward['difficulty'],
      earned: reward['earned'],
      globalStatistic: reward['global_statistic'],
      gameId: reward['game_id']);

  Map<String, dynamic> toMap() => {
        "id": id,
        "icon": icon,
        "name": name,
        "description": description,
        "difficulty": difficulty,
        "earned": earned,
        "global_statistic": globalStatistic,
        "game_id": gameId
      };

  static List<Reward> rewardsFromJson(String jsonData, String filterId) {
    final data = json.decode(jsonData);
    final rewards =
        List<Reward>.from(data.map((reward) => Reward.fromMap(reward)));
    var filteredRewards = <Reward>[];
    rewards.forEach((reward) {
      if (reward.gameId == filterId) filteredRewards.add(reward);
    });
    return filteredRewards;
  }

  static fromJson(String jsonData) {
    final data = json.decode(jsonData);
    return fromMap(data);
  }

  toJson() => json.encode(toMap());

  void copyFrom(Reward otherReward) {
    id = otherReward.id;
    icon = otherReward.icon;
    name = otherReward.name;
    description = otherReward.description;
    difficulty = otherReward.difficulty;
    earned = otherReward.earned;
    globalStatistic = otherReward.globalStatistic;
    gameId = otherReward.gameId;
  }
}
