import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatefulWidget {

  ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();
  late final ScrollController _controller;

  void _handleControllerNotification() {
    final pos = _controller.position.pixels;
    if (pos >= _controller.position.maxScrollExtent) {
      print("over max");
    } else if (pos <= _controller.position.minScrollExtent) {
      print("under min");
    }
  }

  @override void initState() {
    _controller = ScrollController();
    _controller.addListener(_handleControllerNotification);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          // if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView(
              controller: _controller,
              scrollDirection: Axis.vertical,
              children: [
                TodayRecipeListView(
                    recipes: snapshot.data?.todayRecipes ?? []
                ),
                const SizedBox(height: 16,),
                FriendPostListView(
                    friendPosts: snapshot.data?.friendPosts ?? []
                ),
                Container(
                  height: 400,
                  color: Colors.green,
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
    );
  }
}