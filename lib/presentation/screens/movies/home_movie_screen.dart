import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeMovieScreen extends StatelessWidget {
  static const name = 'home-movie-screen';

  const HomeMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatingMoviesprovider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingMoviesSlidesshow = ref.watch(moviesSlidesshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatingMovies = ref.watch(topRatingMoviesprovider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            title: CustomAppbar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) {
              return Column(
                children: [
                  // const CustomAppbar(),
                  MoviesSlidesshow(movies: nowPlayingMoviesSlidesshow),
                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subTitle: 'Lunes 20',
                    loadNextPage: () => ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MovieHorizontalListview(
                    movies: upcomingMovies,
                    title: 'Próximamente',
                    subTitle: 'En este mes',
                    loadNextPage: () => ref
                        .read(upcomingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MovieHorizontalListview(
                    movies: popularMovies,
                    title: 'Populares',
                    // subTitle: 'Lunes 20',
                    loadNextPage: () => ref
                        .read(popularMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MovieHorizontalListview(
                    movies: topRatingMovies,
                    title: 'Top peliculas',
                    // subTitle: 'Lunes 20',
                    loadNextPage: () => ref
                        .read(topRatingMoviesprovider.notifier)
                        .loadNextPage(),
                  ),

                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: nowPlayingMovies.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       final movie = nowPlayingMovies[index];
                  //       return ListTile(
                  //         title: Text(movie.title),
                  //         subtitle: Text(movie.overview),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
