import 'package:cinemapedia/config/contants/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeMovieScreen extends StatelessWidget {
  static const name = 'home-movie-screen';

  const HomeMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Environment.theMovieDBKey),
      ),
    );
  }
}
