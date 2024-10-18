import 'package:flutter/material.dart';

class CharacterFavoriteView extends StatelessWidget {
  const CharacterFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(39, 43, 51, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('asjksladjlksajdklsad'),
            ],
          ),
        ),
      ),
    );
  }
}
