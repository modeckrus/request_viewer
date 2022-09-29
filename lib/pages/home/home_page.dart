import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:request_model/request_model.dart';
import 'package:request_viewer/pages/home/request_widget.dart';

import '../../theme/theme.dart';
import 'home_bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeBloc(), child: const HomeContent());
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Request Viewer'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<HomeBloc>(context).add(HomeClearE());
          },
          backgroundColor:  MyTheme.of(context).redColor,
          child: Icon(
            Icons.clear,
            
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeFetchedS) {
              return ListView.builder(
                itemCount: state.requests.length,
                itemBuilder: (context, index) {
                  final model = state.requests[index];
                  return RequestWidget(model: model);
                },
              );
            }
            return const Center(
              child: Text('Пока нет запросов'),
            );
          },
        ));
  }
}
