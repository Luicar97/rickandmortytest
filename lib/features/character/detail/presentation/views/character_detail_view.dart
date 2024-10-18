import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:trumed/features/character/detail/presentation/blocs/detail_character/detail_character_bloc.dart';
import 'package:trumed/widgets/custom_text_title_widget.dart';

class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final argument =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(39, 43, 51, 1),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.favorite,
          color: Color.fromRGBO(39, 43, 51, 1),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/favorite');
        },
      ),
      body: BlocProvider(
        create: (context) => GetIt.I.get<DetailCharacterBloc>()
          ..add(DetailCharacterEvent.detailCharacter(argument['id'])),
        child: Builder(builder: (context) {
          return BlocBuilder<DetailCharacterBloc, DetailCharacterState>(
            builder: (context, state) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: BlocBuilder<DetailCharacterBloc, DetailCharacterState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return Container();
                        },
                        loading: () {
                          return SizedBox(
                            height: MediaQuery.sizeOf(context).height,
                            child: const Center(
                                child: CircularProgressIndicator(
                              color: Colors.white,
                            )),
                          );
                        },
                        success: (data, episodes) {
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Image.network(
                                      data.image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const Positioned(
                                    right: 16,
                                    top: 16,
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                  Positioned(
                                    left: 16,
                                    top: 16,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(
                                        Icons.arrow_back_ios_outlined,
                                        color: Color.fromRGBO(39, 43, 51, 1),
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextTitleWidget(
                                      title: data.name,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${data.status} - ${data.species}',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      'Gender: ${data.gender}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 22,
                                    ),
                                    if (episodes != null)
                                      Wrap(
                                        runSpacing: 14,
                                        spacing: 14,
                                        children: [
                                          const CustomTextTitleWidget(
                                            title: 'Episodes that appear',
                                            color: Colors.white,
                                          ),
                                          ...episodes.map(
                                            (e) => Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              // width: double.infinity,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(e.name.toString()),
                                                    Text(e.airDate.toString()),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
