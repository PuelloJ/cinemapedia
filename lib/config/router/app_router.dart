import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeMovieScreen.name,
      builder: (context, state) => const HomeMovieScreen(),
    ),
  ],
);
