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
      appBar: AppBar(
        title: Text('FOOD.ID'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.chat),
          ),
        ],
      ),
      body: Column(
        children: [
          const HomeHeaderView(),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadedState) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 140,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final banner = state.topBanners[index];

                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            child: Image.network(
                              banner.media,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      itemCount: state.topBanners.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
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
        ],
      ),
    );
  }
}

class HomeHeaderView extends StatelessWidget {
  const HomeHeaderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              Text(
                'Dikirim ke',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Jakarta Selatan',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          // TODO: Fix color/style
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Mau belanja makanan apa?',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              // fillColor: Colors.red,
              // focusColor: Theme.of(context).colorScheme.onPrimary,
              // iconColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
