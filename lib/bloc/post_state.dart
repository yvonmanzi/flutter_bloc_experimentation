import 'package:equatable/equatable.dart';
import 'package:flutter_infinite_list/Model/post.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostUninitialized extends PostState {}

class PostError extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  final bool hasReachedMax;

  const PostLoaded({this.posts, this.hasReachedMax});

  PostLoaded copyWith({
    List<Post> posts,
    bool hasReachedMax,
  }) {
    // ?? checks if the optional positional argument was supplied
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [posts, hasReachedMax];

  @override
  String toString() {
    return 'PostLoaded {posts: ${posts.length}, hasReachedMax: $hasReachedMax';
  }
}
