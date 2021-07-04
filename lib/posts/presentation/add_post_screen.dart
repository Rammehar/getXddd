import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/post_controller.dart';

class AddPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PostController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Post"),
      ),
      body: Form(
        key: controller.addPostFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              controller: controller.titleController,
              decoration: InputDecoration(hintText: 'Title'),
              onSaved: (value) {
                controller.titleController.text = value!;
              },
              validator: (value) {
                return controller.validateTitle(value!);
              },
            ),
            TextFormField(
              controller: controller.bodyController,
              decoration: InputDecoration(hintText: 'Body'),
              onSaved: (value) {
                controller.bodyController.text = value!;
              },
              validator: (value) {
                return controller.validateBody(value!);
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.blue,
                minimumSize: Size(88, 36),
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              onPressed: () {
                controller.addPost();
              },
              child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
