import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:request_model/request_model.dart';
import 'package:request_viewer/pages/home/request_widget.dart';
import 'package:request_viewer/pages/home/search_cubit/search_cubit.dart';
import 'package:super_validation/super_validation.dart';

import '../../theme/theme.dart';
import 'home_bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => SearchCubit()),
      BlocProvider(
        create: (context) => HomeBloc()..initialize(),
      )
    ], child: const HomeContent());
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeFetchedS) {
          final requests = state.requests;
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(56),
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchOffS) {
                      return AppBar(
                        title: const Text('Request Viewer'),
                        actions: [
                          IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              BlocProvider.of<SearchCubit>(context).searching();
                            },
                          )
                        ],
                      );
                    }
                    return AppBar(
                      title: TextFieldSuperValidation(
                        superValidation:
                            BlocProvider.of<HomeBloc>(context).search,
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            BlocProvider.of<SearchCubit>(context)
                                .notSearching();
                          },
                        )
                      ],
                    );
                  },
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<HomeBloc>(context).clear();
                },
                backgroundColor: MyTheme.of(context).redColor,
                child: Icon(
                  Icons.clear,
                ),
              ),
              body: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (requests.isNotEmpty) {
                    return ListView.builder(
                      itemCount: requests.length,
                      itemBuilder: (context, index) {
                        final model = requests[index];
                        return RequestWidget(model: model);
                      },
                    );
                  }
                  return const Center(
                    child: Text('Пока нет запросов'),
                  );
                },
              ));
        } else {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Request Viewer'),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ));
        }
      },
    );
  }
}
