import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_flutter_ddd_getx/auth/presentation/controllers/auth_controller.dart';
import 'package:sample_flutter_ddd_getx/core/controllers/theme_controller.dart';
import 'package:sample_flutter_ddd_getx/core/models/menu_option_model.dart';

import 'controller/post_controller.dart';
import 'widgets/post_list.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PostController>();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(child: Text("Post List")),
            buildUserInfo(),
          ],
        ),
        actions: [
          signOutButton(),
          themePopUpMenuButton(),
        ],
      ),
      body: Obx(() {
        return controller.isLoading.isTrue
            ? Center(child: CircularProgressIndicator())
            : PostList(controller);
      }),
    );
  }

  buildUserInfo() {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => Text("${controller.user.value!.name}"),
    );
  }

  signOutButton() {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => IconButton(
        onPressed: () {
          controller.signOut();
        },
        icon: Icon(Icons.logout),
      ),
    );
  }

  themePopUpMenuButton() {
    final List<MenuOptionsModel> themeOptions = [
      MenuOptionsModel(
          key: "system", value: 'System', icon: Icons.brightness_4),
      MenuOptionsModel(
          key: "light", value: 'Light'.tr, icon: Icons.brightness_low),
      MenuOptionsModel(key: "dark", value: 'Dark'.tr, icon: Icons.brightness_3)
    ];
    return GetBuilder<ThemeController>(
      builder: (controller) => PopupMenuButton<MenuOptionsModel>(
        icon: Icon(Icons.more_vert),
        onSelected: (choice) {
          controller.setThemeMode(choice.key);
        },
        itemBuilder: (BuildContext context) {
          return themeOptions.map((MenuOptionsModel choice) {
            return PopupMenuItem<MenuOptionsModel>(
              value: choice,
              child: Text("${choice.value}"),
            );
          }).toList();
        },
      ),
    );
  }
}
