import 'package:flutter_movies/src/models/item_model.dart';
import 'package:flutter_movies/src/resources/repository.dart';
import "package:rxdart/rxdart.dart";

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();
  Observable<ItemModel> get allMoves => _moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
