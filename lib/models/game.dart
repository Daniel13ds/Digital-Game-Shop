import 'dart:convert';

import 'package:digital_game_shop/services/gamesApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Game {
  String id;
  String logo;
  String title;
  String description;
  String distributor;
  String date;
  double price;
  double personalScore;
  double globalScore;
  double progress;
  List userId;

  Game(
      {this.id,
      @required this.logo = 'URL',
      @required this.title,
      this.description,
      @required this.distributor,
      @required this.date,
      @required this.price,
      this.personalScore,
      @required this.globalScore = 0,
      this.progress,
      this.userId});

  static Game fromMap(Map<String, dynamic> game) => Game(
      id: game['id'],
      logo: game['logo'],
      title: game['title'],
      description: game['description'],
      distributor: game['distributor'],
      date: game['date'],
      price: game['price'],
      personalScore: game['personal_score'],
      globalScore: game['global_score'],
      progress: game['progress'],
      userId: game['user_id']);

  Map<String, dynamic> toMap() => {
        "id": id,
        "logo": logo,
        "title": title,
        "description": description,
        "distributor": distributor,
        "date": date,
        "price": price,
        "personal_score": personalScore,
        "global_score": globalScore,
        "progress": progress,
        "user_id": userId
      };

  static List<Game> myGamesFromJson(String jsonData, String filterId) {
    final data = json.decode(jsonData);
    final games = List<Game>.from(data.map((game) => Game.fromMap(game)));
    var filteredGames = <Game>[];
    games.forEach((game) {
      if (game.userId.contains(filterId)) filteredGames.add(game);
    });
    return filteredGames;
  }

  static List<Game> gamesFromJson(String jsonData) {
    final data = json.decode(jsonData);
    final games = List<Game>.from(data.map((game) => Game.fromMap(game)));
    return games;
  }

  static fromJson(String jsonData) {
    final data = json.decode(jsonData);
    return fromMap(data);
  }

  toJson() => json.encode(toMap());

  void copyFrom(Game otherGame) {
    id = otherGame.id;
    logo = otherGame.logo;
    title = otherGame.title;
    description = otherGame.description;
    distributor = otherGame.distributor;
    date = otherGame.date;
    price = otherGame.price;
    personalScore = otherGame.personalScore;
    globalScore = otherGame.globalScore;
    progress = otherGame.progress;
    userId = otherGame.userId;
  }
}
