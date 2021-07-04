import '../entities/post.dart';

abstract class PostInterface {
  Future<List<Post>> getAllPosts();
  Future<Post> addPost();
}
