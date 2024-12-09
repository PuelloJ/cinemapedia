import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeMovieScreen extends StatelessWidget {
  static const name = 'home-movie-screen';
  final Widget childView;

  const HomeMovieScreen({
    super.key,
    required this.childView,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: childView,
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
