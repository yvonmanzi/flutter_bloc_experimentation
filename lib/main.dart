import 'package:flutter/material.dart';
import 'package:flutter_movies/src/repository/movie_api_client.dart';
import 'package:flutter_movies/src/repository/movie_repository.dart';
import 'package:flutter_movies/src/ui/app.dart';
import 'package:http/http.dart' as http;

void main() {
  final _movieApiClient = MovieApiClient(client: http.Client());
  final _movieRepository = MovieRepository(moviesApiClient: _movieApiClient);
  runApp(
    App(movieRepository: _movieRepository),
  );
}
