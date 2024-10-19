import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:trumed/features/character/home/presentation/blocs/character_list/character_list_bloc.dart';
import 'package:trumed/widgets/character_card_widget.dart';
import 'package:trumed/widgets/custom_pagination_widget.dart';
import 'package:trumed/widgets/custom_scaffold_widget.dart';
import 'package:trumed/widgets/custom_text_field_widget.dart';
import 'package:trumed/widgets/custom_text_title_widget.dart';

class CharacterView extends StatelessWidget {
  const CharacterView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      favoritePage: true,
      body: BlocProvider(
        create: (context) => GetIt.I.get<CharacterListBloc>()
          ..add(const CharacterListEvent.started()),
        child: Builder(
          builder: (context) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              const CustomTextTitleWidget(
                                title: 'The Rick and Morty API',
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              CustomTextFieldWidget(
                                onChanged: (value) {
                                  context.read<CharacterListBloc>().add(
                                      CharacterListEvent.searchCharacter(
                                          value));
                                },
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<CharacterListBloc, CharacterListState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return Container();
                          },
                          loading: () {
                            return SizedBox(
                              height: MediaQuery.sizeOf(context).height / 2,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                          success: (data) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 16,
                                  children: [
                                    ...data.results.map((result) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                            '/details',
                                            arguments: {'id': result.id},
                                          );
                                        },
                                        child: CharacterCardWidget(
                                          image: result.image,
                                          species: result.species,
                                          name: result.name,
                                          status: result.status,
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                                CustomPaginationWidget(
                                  numberOfPages: 5,
                                  totalPages: data.info.pages,
                                  currentPage:
                                      context.read<CharacterListBloc>().page,
                                  changePage: (index) {
                                    context.read<CharacterListBloc>().add(
                                        CharacterListEvent.changePageApi(
                                            index + 1, ''));

                                    context.read<CharacterListBloc>().add(
                                        CharacterListEvent.changePage(index));
                                  },
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
