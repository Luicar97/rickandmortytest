import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:trumed/features/character/detail/presentation/blocs/detail_character/detail_character_bloc.dart';

class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(39, 43, 51, 1),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        onPressed: () {},
      ),
      body: BlocProvider(
        create: (context) => GetIt.I.get<DetailCharacterBloc>()
          ..add(const DetailCharacterEvent.detailCharacter()),
        child: Builder(builder: (context) {
          return BlocBuilder<DetailCharacterBloc, DetailCharacterState>(
            builder: (context, state) {
              return Container(
                child: const Text('data'),
              );
            },
          );
        }),
      ),
    );
  }
}
