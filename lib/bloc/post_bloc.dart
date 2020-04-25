import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/Model/post.dart';
import 'package:http/http.dart' as http;

import 'bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;

  @override
  PostState get initialState => PostUninitialized();

  // this is fired every time an event is added.
  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostUninitialized) {
          final posts = await _fetchPosts(0, 20);
          yield PostLoaded(posts: posts, hasReachedMax: false);
          return;
        }
        if (currentState is PostLoaded) {
          final posts = await _fetchPosts(currentState.posts.length, 20);
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostLoaded(
                  posts: currentState.posts + posts,
                  hasReachedMax: false,
                );
        }
      } catch (_) {
        yield PostError();
      }

      bool _hasReachedMax(PostState state) {
        return state is PostLoaded && state.hasReachedMax;
      }
    }
  }

  _fetchPosts(int length, int i) async {
    final response = await httpClient.get('https://jsonplaceholder.');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data
          .map((e) => Post(id: e['id'], title: e['title'], body: e['body']))
          .toList();
    } else {
      throw Exception("error fetching psots");
    }
  }
}
