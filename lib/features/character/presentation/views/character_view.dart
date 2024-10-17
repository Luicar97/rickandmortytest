import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:trumed/features/character/presentation/blocs/character_list/character_list_bloc.dart';
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
        create: (context) => GetIt.I.get<CharacterListBloc>(),
        child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      const CustomTextTitleWidget(
                        title:
                            'Busca tu personaje… pero, por favor, no seas como Jerry. El universo ya tiene suficiente de eso.',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFieldWidget(
                        onChanged: (p0) {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Image.network(
                                    'https://dummyimage.com/170x180/000/fff'),
                              ),
                              const Text(
                                'Rick Sanchez',
                                style: TextStyle(
                                  fontSize: 16,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Image.network(
                                'https://dummyimage.com/170x180/000/fff'),
                          ),
                          Container(
                            child: Image.network(
                                'https://dummyimage.com/170x180/000/fff'),
                          ),
                          Container(
                            child: Image.network(
                                'https://dummyimage.com/170x180/000/fff'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent.withOpacity(0.4),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                            ),
                            child: const Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //   Center(
                      //     child: ElevatedButton(
                      //       onPressed: () {
                      //         context
                      //             .read<CharacterListBloc>()
                      //             .add(const CharacterListEvent.started());
                      //       },
                      //       child: const Text(' jklasjdklsaj'),
                      //     ),
                      //   ),
                      //   BlocBuilder<CharacterListBloc, CharacterListState>(
                      //     bloc: context.read<CharacterListBloc>(),
                      //     builder: (context, state) {
                      //       return state.when(inital: () {
                      //         return Center(
                      //           child: mainButton(context),
                      //         );
                      //       }, loading: () {
                      //         return _loading;
                      //       }, success: () {
                      //         return _factUI(context);
                      //       }, error: (error) {
                      //         return _error(error);
                      //       });
                      //     },
                      //   )
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
