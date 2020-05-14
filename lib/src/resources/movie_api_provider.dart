import 'dart:async';
import 'dart:convert';

import 'package:flutter_movies/src/models/item_model.dart';
import 'package:http/http.dart';

class MovieApiProvider {
  Client client = Client();
  final String _apiKey = "51ebc7a012bf9db164589db169e75cbd";

  Future<List<Movie>> fetchMovieList() async {
    print('entered');
    final response = await client
        .get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200) {
      var result = MovieDBTrendingApiResult.fromJson(jsonDecode(response.body));
      return result.movieList;
    } else
      throw Exception('Failed to load post');
  }
}
