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
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    return Column(
      children: [
        const CustomAppbar(),
        MoviesSlidesshow(movies: nowPlayingMovies),
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
  }
}
