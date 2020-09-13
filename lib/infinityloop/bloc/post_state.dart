import 'package:equatable/equatable.dart';
import 'package:flutter_widgets/infinityloop/post.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitialState extends PostState {}

class PostFailureState extends PostState {}
class PostSuccessState extends PostState{
  final List<Post> posts;
  final bool hasReachedMax;
  const PostSuccessState({
    this.posts,
    this.hasReachedMax,
  });

  PostSuccessState copyWith({
    List<Post> posts,
    bool hasReachedMax,
  }) {
    return PostSuccessState(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [posts, hasReachedMax];

  @override
  String toString() =>
      'PostSuccess { posts: ${posts.length}, hasReachedMax: $hasReachedMax }';
}
