import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';

import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  // 1
  final mockService = MockFooderlichService();

  late ScrollController _controller;

  @override
  void initState() {
    // 1
    _controller = ScrollController();

    // 2
    _controller.addListener(_scrollListener);

    super.initState();
  }

  void _scrollListener() {
    // 1
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      print("i am at the bottom!");
    }

    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      print('i am at the top!');
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  Widget build(BuildContext context) {
    // 1
    return FutureBuilder(
      // 2
      // todo 1: add todayrecipelistview futurebuilder
      future: mockService.getExploreData(),
      // 3
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // todo: add nested list views
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          return ListView(
            
            controller: _controller,
            // 6
            scrollDirection: Axis.vertical,
            children: [
              // 7
              TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),

              // 8
              const SizedBox(height: 16),
              // 9
              // todo: replace this with frdpostlistview
              FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? []),

              // Container(
              //   height: 400,
                // color: Colors.green,
              // ),
            ],
          );

          // return Center(
          //   child: Container(
          //     child: const Text('Show TodayRecipeListView'),
          //   ),
          // );
        } else {
          // 6
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
