import 'package:get/get.dart';
import 'package:sample_flutter_ddd_getx/posts/domain/entities/post.dart';
import 'package:sample_flutter_ddd_getx/posts/infrastructure/repositories/post_repository.dart';

class PostFacadeService {
  late PostRepository postRepository;

  PostFacadeService() {
    this.postRepository = Get.put(PostRepository());
  }
  Future<List<Post>> getAllPosts() {
    return postRepository.getAllPosts();
  }

  Future<Post> addPost() {
    return postRepository.addPost();
  }
}
