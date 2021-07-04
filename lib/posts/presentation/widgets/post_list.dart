import 'package:flutter/material.dart';
import 'package:sample_flutter_ddd_getx/posts/presentation/controller/post_controller.dart';

class PostList extends StatelessWidget {
  const PostList(this.controller);
  final PostController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ListView.builder(
        itemCount: controller.posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(controller.posts[index].title),
          );
        },
      ),
    );
  }
}
