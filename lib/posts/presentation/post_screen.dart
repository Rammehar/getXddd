import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/post_controller.dart';
import 'widgets/post_list.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PostController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Post List"),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('/add-post');
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Obx(() {
        return controller.isLoading.isTrue
            ? Center(child: CircularProgressIndicator())
            : PostList(controller);
      }),
    );
  }
}
