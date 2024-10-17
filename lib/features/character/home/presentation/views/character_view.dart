import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:trumed/features/character/home/presentation/blocs/character_list/character_list_bloc.dart';
import 'package:trumed/widgets/custom_pagination_widget.dart';
import 'package:trumed/widgets/custom_text_field_widget.dart';
import 'package:trumed/widgets/custom_text_title_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        onPressed: () {},
      ),
      body: BlocProvider(
        create: (context) => GetIt.I.get<CharacterListBloc>()
          ..add(const CharacterListEvent.started()),
        child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  color: const Color.fromRGBO(39, 43, 51, 1),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.white,
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
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                            success: (data) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 16,
                                    children: [
                                      ...data.results.map((result) {
                                        return Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(18),
                                                topRight: Radius.circular(18),
                                              ),
                                              child: Image.network(
                                                result.image,
                                                width: 170,
                                                height: 170,
                                              ),
                                            ),
                                            Container(
                                              width: 170,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      result.name,
                                                      maxLines: 1,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromRGBO(
                                                            39, 43, 51, 1),
                                                      ),
                                                    ),
                                                    Flex(
                                                      direction:
                                                          Axis.horizontal,
                                                      children: [
                                                        Container(
                                                          width: 10,
                                                          height: 10,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 6,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            '${result.status} - ${result.species}',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      39,
                                                                      43,
                                                                      51,
                                                                      1),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                    ],
                                  ),
                                  Container(
                                    child: CustomPaginationWidget(
                                      numberOfPages: 5,
                                      totalPages: data.info.pages,
                                      currentPage: context
                                          .read<CharacterListBloc>()
                                          .page,
                                      changePage: (index) {
                                        context.read<CharacterListBloc>().add(
                                            CharacterListEvent.changePageApi(
                                                index + 1, ''));

                                        context.read<CharacterListBloc>().add(
                                            CharacterListEvent.changePage(
                                                index));
                                      },
                                    ),
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
              ),
            );
          },
        ),
      ),
    );
  }

  Center _error(String error) {
    return Center(
      child: Text(error),
    );
  }

  Widget _factUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(fact.fact),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Fun fact, the abve fact has: characters',
          ),
          const SizedBox(
            height: 15,
          ),
          mainButton(context),
        ],
      ),
    );
  }

  Widget get _loading => const Center(
        child: CircularProgressIndicator(),
      );

  Widget mainButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // context.read<LoginBloc>().add(LoginEvent.oneMoreFunFact());
        },
        child: const Text("Hit me baby one more time"));
  }
}
