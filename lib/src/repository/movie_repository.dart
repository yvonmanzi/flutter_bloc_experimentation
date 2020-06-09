import 'dart:async';

import 'package:meta/meta.dart';

import '../models/models.dart';
import 'movie_api_client.dart';

class MovieRepository {
  final MovieApiClient moviesApiClient;

  MovieRepository({@required this.moviesApiClient})
      : assert(moviesApiClient != null);

  Future<List<Movie>> fetchAllMovies() => moviesApiClient.fetchMovieList();
}
