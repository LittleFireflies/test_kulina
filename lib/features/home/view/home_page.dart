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
            icon: const Icon(Icons.chat),
          ),
        ],
      ),
      body: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HomeHeaderView(),
          ),
          _TopBannersView(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Special di FOOD.ID',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _SmallBannersView(),
        ],
      ),
    );
  }
}

class _SmallBannersView extends StatelessWidget {
  const _SmallBannersView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadedState) {
          return SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final banner = state.smallBanners[index];

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.network(
                      banner.media,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                childCount: state.smallBanners.length,
              ),
            ),
          );
        } else if (state is HomeLoadErrorState) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.message),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class _TopBannersView extends StatelessWidget {
  const _TopBannersView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadedState) {
          return SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
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
            ),
          );
        } else if (state is HomeLoadErrorState) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.message),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
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
