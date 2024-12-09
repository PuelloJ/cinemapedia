import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/view/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // ShellRoute

    ShellRoute(
      builder: (context, state, child) {
        return HomeMovieScreen(childView: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeView(),
          routes: [
            GoRoute(
              path: 'movie/:id',
              name: MovieScreen.name,
              builder: (context, state) {
                final movieId = state.pathParameters['id'] ?? 'no-id';
                return MovieScreen(movieId: movieId);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const FavoritesView(),
        ),
      ],
    )

    // Rutas padre/hijos
    // GoRoute(
    //   path: '/',
    //   name: HomeMovieScreen.name,
    //   builder: (context, state) => const HomeMovieScreen(
    //     childView: FavoritesView(),
    //   ),
    //   routes: [
    //     GoRoute(
    //       path: 'movie/:id',
    //       name: MovieScreen.name,
    //       builder: (context, state) {
    //         final movieId = state.pathParameters['id'] ?? 'no-id';
    //         return MovieScreen(movieId: movieId);
    //       },
    //     ),
    //   ],
    // ),
  ],
);
