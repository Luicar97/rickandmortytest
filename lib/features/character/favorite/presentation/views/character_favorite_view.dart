import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:trumed/features/character/favorite/presentation/blocs/character_favorite/character_favorite_bloc.dart';
import 'package:trumed/widgets/character_card_widget.dart';
import 'package:trumed/widgets/custom_text_title_widget.dart';

class CharacterFavoriteView extends StatelessWidget {
  const CharacterFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(39, 43, 51, 1),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => GetIt.I.get<CharacterFavoriteBloc>()
            ..add(const CharacterFavoriteEvent.listFavorite()),
          child: Builder(builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                            size: 34,
                          ),
                        )),
                  ),
                  Container(
                    height: 16,
                  ),
                  const CustomTextTitleWidget(
                    title: 'Favorite characters',
                    color: Colors.white,
                  ),
                  Container(
                    height: 16,
                  ),
                  BlocBuilder<CharacterFavoriteBloc, CharacterFavoriteState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return Container();
                        },
                        loading: () {
                          return SizedBox(
                            height: MediaQuery.sizeOf(context).height / 2,
                            child: const Center(
                                child: CircularProgressIndicator()),
                          );
                        },
                        success: (data) {
                          return Wrap(
                            runSpacing: 12,
                            spacing: 12,
                            children: [
                              ...data.map(
                                (e) => CharacterCardWidget(
                                  image: e.image,
                                  name: e.name,
                                  onTap: () {
                                    context.read<CharacterFavoriteBloc>().add(
                                          CharacterFavoriteEvent.deleteFavorite(
                                              e.characterId),
                                        );
                                  },
                                  favorite: true,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
