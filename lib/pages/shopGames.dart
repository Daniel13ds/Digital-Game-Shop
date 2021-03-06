import 'package:digital_game_shop/models/game.dart';
import 'package:digital_game_shop/models/shopGamesModel.dart';
import 'package:digital_game_shop/pages/shopGameInfo.dart';
import 'package:digital_game_shop/pages/userGameInfo.dart';
import 'package:digital_game_shop/pages/userGames.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scoped_model/scoped_model.dart';

import 'gameForm.dart';

class ShopGames extends StatelessWidget {
  static final route = '/shopGames';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shop'),
          actions: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () =>
                  Navigator.popAndPushNamed(context, UserGames.route),
            ),
          ],
        ),
        body: Stack(children: [_createList(context)]));
  }

  Widget _createList(BuildContext context) {
    return ScopedModelDescendant<ShopGamesModel>(
        rebuildOnChange: true,
        builder: (context, child, model) => FutureBuilder<List<Game>>(
              future: model.games,
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
              title: Text('There is no game in the Shop'),
              subtitle: Text('Wait to the next update'),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildGamesList(List<Game> games) {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        var game = games[index];
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
          child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            secondaryActions: [
              SlideAction(
                child: ClipOval(
                  child: Material(
                    color: Colors.red, // button color
                    child: InkWell(
                      child: SizedBox(
                          width: 65, height: 65, child: Icon(Icons.delete)),
                    ),
                  ),
                ),
                onTap: () => _deleteGame(context, game),
              )
            ],
            child: Card(
              elevation: 10,
              color: Colors.cyanAccent[400],
              child: ListTile(
                title: Text(game.title,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                subtitle: Text(game.distributor,
                    style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pushNamed(context, ShopGameInfo.route,
                      arguments: game);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void _deleteGame(BuildContext context, Game game) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Game'),
        content: Text('Are you sure that you want to delete ${game.title}?'),
        actions: [
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ScopedModelDescendant<ShopGamesModel>(
            rebuildOnChange: true,
            builder: (context, child, model) => FlatButton(
              onPressed: () async {
                Navigator.pop(context);
                var deleted = await model.removeGame(game);
                if (!deleted) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("The game can't be deleted"),
                    duration: Duration(seconds: 5),
                  ));
                }
              },
              child: Text('Confirm'),
            ),
          )
        ],
      ),
    );
  }
}
