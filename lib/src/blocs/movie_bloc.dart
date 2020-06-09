import 'package:bloc/bloc.dart';
import 'package:flutter_movies/src/models/models.dart';
import 'package:flutter_movies/src/repository/repository.dart';
import 'package:meta/meta.dart';

import 'blocs.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc({@required this.movieRepository}) : assert(movieRepository != null);

  @override
  get initialState => MoviePreLoad();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is StartApp) {
      yield MovieLoading();
      try {
        List<Movie> movies = await movieRepository.fetchAllMovies();
        yield MovieLoaded(movies: movies);
      } catch (error) {
        yield MovieLoadFailed(error: error.toString());
      }
    }
  }
}
