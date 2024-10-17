import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:trumed/core/theme/app_theme.dart';
import 'package:trumed/features/character/detail/presentation/views/character_detail_view.dart';
import 'package:trumed/features/character/home/presentation/views/character_view.dart';
import 'package:trumed/l10n/gen_l10n/app_localizations.dart';
import 'package:trumed/router/router.dart';
import 'package:trumed/services/navigation_service.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PendWenz Demo',
      theme: AppTheme.commonTheme,
      routes: {
        '/': (context) => const CharacterView(),
        '/details': (context) => const CharacterDetailView(),
      },
    );
  }
}
