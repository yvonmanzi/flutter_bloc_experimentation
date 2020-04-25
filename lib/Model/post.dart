// this is used to compare objects.by default,
// the equality operator returns true if and only if this and other are the same instance.
import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  const Post({this.id, this.title, this.body});

  @override
  List<Object> get props {
    return [id, title, body];
  }

  @override
  String toString() {
    return 'Post {id:$id}';
  }
}
