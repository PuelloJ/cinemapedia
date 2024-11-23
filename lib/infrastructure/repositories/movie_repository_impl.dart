import 'package:cinemapedia/dominio/datasources/movies_datasource.dart';
import 'package:cinemapedia/dominio/entities/movie.dart';
import 'package:cinemapedia/dominio/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource dataSource;

  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }
}
