import 'package:digital_game_shop/models/game.dart';
import 'package:digital_game_shop/models/reward.dart';
import 'package:digital_game_shop/models/rewardsModel.dart';
import 'package:digital_game_shop/pages/rewardInfo.dart';
import 'package:digital_game_shop/pages/userGames.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class GameRewards extends StatelessWidget {
  static final route = '/gameRewards';
  Game game;
  RewardsModel rewardsModel;

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context).settings.arguments;
    game = arguments;
    rewardsModel = RewardsModel(game);
    return ScopedModel(
      model: rewardsModel,
      child: ScopedModelDescendant<RewardsModel>(
        builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              title: Text("Rewards"),
              actions: [
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, UserGames.route, (route) => false),
                ),
              ],
            ),
            body: Stack(children: [_createList(context)])),
      ),
    );
  }

  Widget _createList(BuildContext context) {
    return ScopedModelDescendant<RewardsModel>(
        rebuildOnChange: true,
        builder: (context, child, model) => FutureBuilder<List<Reward>>(
              future: model.rewards,
              builder: (context, snapshot) {
                var childWidgets;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    childWidgets = ListView(
                      children: [Center(child: CircularProgressIndicator())],
                    );
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      childWidgets = ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Card(
                              child: ListTile(
                                leading: Icon(Icons.wifi_off_rounded),
                                title: Text('Conexion Error'),
                                subtitle: Text('The Server is Unreachable'),
                              ),
                            ),
                          )
                        ],
                      );
                    } else {
                      if (snapshot.data == null || snapshot.data.length == 0) {
                        childWidgets = _buildEmptyList();
                      } else {
                        childWidgets = _buildGamesList(snapshot.data);
                      }
                    }
                    break;
                  default:
                    childWidgets = ListView(
                      children: [
                        Center(
                          child: Text('Text'),
                        )
                      ],
                    );
                    break;
                }
                return RefreshIndicator(
                  onRefresh: model.refresh,
                  child: childWidgets,
                );
              },
            ));
  }

  Widget _buildEmptyList() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Card(
            child: ListTile(
              leading: Icon(
                Icons.emoji_emotions,
                size: 50,
              ),
              title: Text('This game dont have any rewards'),
              subtitle: Text('Wait to future updates'),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildGamesList(List<Reward> rewards) {
    return ListView.builder(
      itemCount: rewards.length,
      itemBuilder: (context, index) {
        var reward = rewards[index];
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
          child: Card(
            elevation: 10,
            color: Colors.cyanAccent[400],
            child: ListTile(
              title: Text(reward.name,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              subtitle: Text(reward.description,
                  style: TextStyle(color: Colors.black)),
              onTap: () async {
                Navigator.pushNamed(context, RewardInfo.route,
                    arguments: reward);
              },
            ),
          ),
        );
      },
    );
  }
}
