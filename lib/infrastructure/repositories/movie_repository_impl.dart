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

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return dataSource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRating({int page = 1}) {
    return dataSource.getTopRating(page: page);
  }

  @override
  Future<List<Movie>> getUpComing({int page = 1}) {
    return dataSource.getUpComing(page: page);
  }
}
