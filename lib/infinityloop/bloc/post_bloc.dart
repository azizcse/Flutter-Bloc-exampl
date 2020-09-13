import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widgets/infinityloop/bloc/bloc.dart';
import 'package:flutter_widgets/infinityloop/post.dart';
import 'package:http/http.dart' as http;

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;

  PostBloc({@required this.httpClient}) : super(PostInitialState());

 /* @override
  Stream<Transition<PostEvent, PostState>> transformEvents(Stream<PostEvent> events, transitionFn) {
    events.distinct()
    return super.transformEvents(
      events.distinct(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }*/


  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is FetchPost && !_hasReachedMax(currentState)) {
      print("Initial called ========");

      try {
        if (currentState is PostInitialState) {
          final posts = await _fetchPosts(0, 20);
          yield PostSuccessState(posts: posts, hasReachedMax: false);
        } else if (currentState is PostSuccessState) {
          final posts = await _fetchPosts(currentState.posts.length, 20);
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostSuccessState(
                  posts: currentState.posts + posts, hasReachedMax: false);
        }
      } catch (_) {
        yield PostFailureState();
      }
    }
  }

  bool _hasReachedMax(PostState state) =>
      state is PostSuccessState && state.hasReachedMax;

  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {
    print("Called data api----------");

    final response = await httpClient.get(
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');
    print("Called data api----------: ${response.statusCode}");
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      print("Called data api----------: $data");
      var result = List<Post>();
      data.forEach((element) {
        var post = Post(id: element['id'], title: element['title'], body: element['body']);
        result.add(post);
      });
      /*return data.map((rawPost) {
        return Post(
            id: rawPost['id'], title: rawPost['title'], body: rawPost['body']);
      });*/
      print("Called data api----------: ${result.length}");
      return result;
    } else {
      throw Exception('Error fetching post');
    }
  }
}
