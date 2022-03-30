import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_kulina/features/home/bloc/home_bloc.dart';
import 'package:test_kulina/features/home/bloc/home_event.dart';
import 'package:test_kulina/features/home/bloc/home_state.dart';
import 'package:test_kulina/repository/app_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        context.read<AppRepositoryImpl>(),
      )..add(const LoadHomeBanners()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadedState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final banner = state.banners[index];

                return ListTile(
                  title: Text(banner.media),
                );
              },
              itemCount: state.banners.length,
            );
          } else if (state is HomeLoadErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
