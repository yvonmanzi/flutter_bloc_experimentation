import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/src/blocs/blocs.dart';
import 'package:flutter_movies/src/repository/movie_repository.dart';

import 'movie_list.dart';

class App extends StatelessWidget {
  final MovieRepository movieRepository;

  App({@required this.movieRepository}) : assert(movieRepository != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: BlocProvider<MovieBloc>(
          create: (context) => MovieBloc(movieRepository: movieRepository),
          child: MovieList(),
        ));
  }
}
