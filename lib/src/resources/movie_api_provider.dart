import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_movies/src/models/item_model.dart';
import 'package:http/http.dart';

class MovieApiProvider {
  Client client = Client();
  final String _apiKey = "51ebc7a012bf9db164589db169e75cbd";

  Future<ItemModel> fetchMovieList() async {
    print('entered');
    final response = await client.get(
        "http://api.themoviedb.org/3/movie/popular?",
        headers: {HttpHeaders.authorizationHeader: _apiKey});
    print(response.body.toString());
    if (response.statusCode == 200)
      return ItemModel.fromJson(json.decode(response.body));
    else
      throw Exception('Failed to load post');
  }
}
