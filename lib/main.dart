import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widgets/app.dart';
import 'package:flutter_widgets/infinityloop/bloc/bloc.dart';
import 'package:flutter_widgets/infinityloop/bloc/bloc_observer.dart';
import 'package:flutter_widgets/infinityloop/bloc/post_bloc.dart';
import 'package:flutter_widgets/infinityloop/bottom_loader.dart';
import 'package:flutter_widgets/infinityloop/post_widget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'getpackage/home_page.dart';

void main() {
  /*Bloc.observer = SimpleBlocObserver();
  runApp(InfinityApp());*/

  runApp(GetHome());
}

class GetHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: GetStateManage(),
      theme: ThemeData(
        accentColor: Colors.purpleAccent,
        primaryColor: Colors.purple,
      ),
    );
  }
}

class InfinityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Infinite Scroll',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: BlocProvider<PostBloc>(
          create: (context) =>
              PostBloc(httpClient: http.Client())..add(FetchPost()),
          child: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  PostBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<PostBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      if (state is PostInitialState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is PostFailureState) {
        return Center(
          child: Text('failed to fetch posts'),
        );
      }

      if (state is PostSuccessState) {
        if (state.posts.isEmpty) {
          return Center(
            child: Text('No post'),
          );
        }
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return index >= state.posts.length
                ? BottomLoader()
                : PostWidget(post: state.posts[index]);
          },
          itemCount:
              state.hasReachedMax ? state.posts.length : state.posts.length + 1,
          controller: _scrollController,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.add(FetchPost());
    }
  }
}
