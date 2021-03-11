import 'package:digital_game_shop/models/game.dart';
import 'package:digital_game_shop/models/shopGamesModel.dart';
import 'package:digital_game_shop/pages/userGames.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class GameForm extends StatelessWidget {
  static final route = '/gameForm';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Game game = Game();
  Game updateGame;
  bool isEditing = false;

  String _validate(String value) {
    if (value == null || value == '') {
      return 'This is obligatory';
    } else if (value.length < 3) {
      return 'The content must be longer than 3';
    }
  }

  saveForm(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      var updated;
      if (isEditing) {
        updateGame.copyFrom(game);
        ScopedModel.of<ShopGamesModel>(context, rebuildOnChange: true)
            .updateGame(game);
      } else {
        ScopedModel.of<ShopGamesModel>(context, rebuildOnChange: true)
            .addGame(game);
      }
      game = Game();
      Navigator.pop(context, updated);
    }
  }

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context).settings.arguments;
    if (arguments != null) {
      updateGame = arguments;
      game.id = updateGame.id;
      isEditing = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('New Game'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, UserGames.route, (route) => false),
          )
        ],
      ),
      bottomNavigationBar: _buttonsForm(context),
      body: _bodyForm(context),
    );
  }

  Form _bodyForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        ListTile(
          leading: Icon(Icons.title),
          title: TextFormField(
            initialValue: isEditing ? updateGame.title : game.title,
            decoration: InputDecoration(hintText: 'Title'),
            validator: _validate,
            onSaved: (newValue) => game.title = newValue,
          ),
        ),
        ListTile(
          leading: Icon(Icons.content_copy),
          title: TextFormField(
            initialValue: isEditing ? updateGame.description : game.description,
            decoration: InputDecoration(hintText: 'Description'),
            maxLines: 6,
            onSaved: (newValue) => game.description = newValue,
          ),
        ),
        ListTile(
          leading: TextFormField(
            initialValue: isEditing ? updateGame.distributor : game.distributor,
            decoration: InputDecoration(hintText: 'Distributor'),
            validator: _validate,
            onSaved: (newValue) => game.distributor = newValue,
          ),
        ),
        ListTile(
          leading: TextFormField(
            initialValue: isEditing ? updateGame.date : game.date,
            decoration: InputDecoration(hintText: 'Date'),
            validator: _validate,
            onSaved: (newValue) => game.date = newValue,
          ),
        ),
        ListTile(
          leading: TextFormField(
            initialValue: isEditing
                ? updateGame.globalScore.toString()
                : game.globalScore.toString(),
            decoration: InputDecoration(hintText: 'Global Score'),
            validator: _validate,
            onSaved: (newValue) => game.globalScore = double.parse(newValue),
          ),
        ),
        ListTile(
          leading: TextFormField(
            initialValue: isEditing ? updateGame.logo : game.logo,
            decoration: InputDecoration(hintText: 'Logo URL'),
            validator: _validate,
            onSaved: (newValue) => game.logo = newValue,
          ),
        )
      ]),
    );
  }

  Padding _buttonsForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel')),
          FlatButton(
              onPressed: () {
                saveForm(context);
              },
              child: Text('Save')),
        ],
      ),
    );
  }
}
