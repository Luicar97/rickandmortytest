import 'package:flutter/material.dart';
import 'package:trumed/app.dart';
import 'package:trumed/core/database/database.dart';
import 'package:trumed/core/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await DatabaseHelper().database;
  runApp(const AppView());
}
