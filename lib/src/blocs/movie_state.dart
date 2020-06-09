import 'package:equatable/equatable.dart';
import 'package:flutter_movies/src/models/models.dart';
import 'package:meta/meta.dart';

class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MoviePreLoad extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;

  const MovieLoaded({@required this.movies}) : assert(movies != null);

  @override
  List<Object> get props => [movies];
}

class MovieLoadFailed extends MovieState {
  final String error;

  const MovieLoadFailed({this.error});

  @override
  List<Object> get props => [error];
}

class MovieLoading extends MovieState {}
