import 'package:flutter/material.dart';
import 'package:trumed/core/theme/app_theme.dart';
import 'package:trumed/features/character/detail/presentation/views/character_detail_view.dart';
import 'package:trumed/features/character/favorite/presentation/views/character_favorite_view.dart';
import 'package:trumed/features/character/home/presentation/views/character_view.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick And Morty',
      theme: AppTheme.commonTheme,
      routes: {
        '/': (context) => const CharacterView(),
        '/details': (context) => const CharacterDetailView(),
        '/favorite': (context) => const CharacterFavoriteView(),
      },
    );
  }
}
