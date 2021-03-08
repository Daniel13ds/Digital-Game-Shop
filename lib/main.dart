import 'package:digital_game_shop/models/preferences.dart';
import 'package:flutter/material.dart';

import 'app/myApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = Preferences();
  await preferences.initPreferences();
  runApp(MyApp());
}
