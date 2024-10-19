import 'package:flutter/material.dart';

class CustomScaffoldWidget extends StatelessWidget {
  final bool favoritePage;
  final Widget body;

  const CustomScaffoldWidget({
    super.key,
    this.favoritePage = false,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(39, 43, 51, 1),
      floatingActionButton: favoritePage == true
          ? FloatingActionButton(
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.favorite,
                color: Color.fromRGBO(39, 43, 51, 1),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/favorite');
              },
            )
          : null,
      body: body,
    );
  }
}
