import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_flutter_ddd_getx/posts/presentation/add_post_screen.dart';

import 'posts/presentation/bindings/post_bindings.dart';
import 'posts/presentation/post_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: "/posts",
          page: () => PostScreen(),
          binding: PostBindings(),
        ),
        GetPage(
            name: "/add-post",
            page: () => AddPostScreen(),
            binding: PostBindings()),
      ],
      initialRoute: "/posts",
    );
  }
}
