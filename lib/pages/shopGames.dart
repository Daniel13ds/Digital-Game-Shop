import 'package:digital_game_shop/pages/userGames.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        body: _buildEmptyList());
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
}
