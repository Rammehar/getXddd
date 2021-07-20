import 'package:get/get.dart';
import 'package:sample_flutter_ddd_getx/posts/application/post_facade_service.dart';
import 'package:sample_flutter_ddd_getx/posts/presentation/controller/post_controller.dart';

class PostBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PostFacadeService());
    Get.lazyPut<PostController>(() => PostController());
  }
}
