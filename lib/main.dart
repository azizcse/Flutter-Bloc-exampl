import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widgets/app.dart';
import 'package:flutter_widgets/infinityloop/bloc/bloc.dart';
import 'package:flutter_widgets/infinityloop/bloc/bloc_observer.dart';
import 'package:flutter_widgets/infinityloop/bloc/post_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
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
    return Scaffold(
      body: Container(
        child: BlocBuilder(builder: null),
      ),
    );
    //
    // return BlocBuilder<PostBloc, PostEvent>(builder: (context, state) {
    //   if (state is PostInitialState) {
    //     return Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   }
    //   if (state is PostFailureState) {
    //     return Center(
    //       child: Text('failed to fetch posts'),
    //     );
    //   }
    //
    //   if (state is PostSuccessState) {
    //     if (state.posts.isEmpty) {
    //       return Center(
    //         child: Text('No post'),
    //       );
    //     }
    //     return ListView.builder(
    //       itemBuilder: (BuildContext context, int index) {
    //         return index >= state.posts.length
    //             ? BottomLoader()
    //             : PostWidget(post: state.posts[index]);
    //       },
    //       itemCount:
    //           state.hasReachedMax ? state.posts.length : state.posts.length + 1,
    //       controller: _scrollController,
    //     );
    //   }
    // });
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
