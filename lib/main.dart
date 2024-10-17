import 'package:flutter/material.dart';
import 'package:trumed/app.dart';
import 'package:trumed/core/di/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const AppView());
}
