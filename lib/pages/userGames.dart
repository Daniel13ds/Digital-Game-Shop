import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserGames extends StatelessWidget {
  static final route = '/userGames';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Videogames'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Card(
              child: ListTile(
                leading: Icon(
                  Icons.emoji_emotions,
                  size: 50,
                ),
                title: Text("You don't have any games jet"),
                subtitle: Text('Go to the shop to buy some games'),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}
