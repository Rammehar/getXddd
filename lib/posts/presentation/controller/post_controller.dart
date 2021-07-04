import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_flutter_ddd_getx/posts/application/post_facade_service.dart';
import 'package:sample_flutter_ddd_getx/posts/domain/entities/post.dart';

class PostController extends GetxController {
  late PostFacadeService _postFacadeService;
  RxBool isLoading = false.obs;

  late RxList<Post> posts;

  final GlobalKey<FormState> addPostFormKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController bodyController;

  //constructor
  PostController() {
    _postFacadeService = Get.find<PostFacadeService>();
    loadPosts();
  }

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    bodyController = TextEditingController();
  }

  @override
  void onClose() {
    titleController.dispose();
    bodyController.dispose();
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }

  loadPosts() async {
    showLoading();
    final result = await _postFacadeService.getAllPosts();
    hideLoading();
    posts = result.obs;
  }

  addPost() async {}

  //validation methods

  String? validateTitle(String value) {
    if (!GetUtils.isLengthGreaterThan(value, 6)) {
      return "Provide valid Title";
    }
    return null;
  }

  String? validateBody(String value) {
    if (GetUtils.isBlank(value)!) {
      return "Could not be empty";
    }
    return null;
  }
}
