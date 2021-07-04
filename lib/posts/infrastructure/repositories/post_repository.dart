import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sample_flutter_ddd_getx/common/utils/connectivity.dart';
import 'package:sample_flutter_ddd_getx/posts/domain/entities/post.dart';
import 'package:sample_flutter_ddd_getx/posts/domain/interfaces/post_interface.dart';
import 'package:sample_flutter_ddd_getx/posts/infrastructure/data_sources/remote_service.dart';
import 'package:sample_flutter_ddd_getx/posts/infrastructure/models/post_model.dart';

class PostRepository implements PostInterface {
  late DioClient dioClient;
  late Connectivity connectivity;

  PostRepository() {
    final dio = Dio();
    dioClient = DioClient(dio);
    this.connectivity = Get.put(Connectivity());
  }

  @override
  Future<List<Post>> getAllPosts() async {
    try {
      //fetch data from remote location
      final response = await dioClient.get("/posts") as List;
      return response.map((json) => PostModel.fromJson(json)).toList();
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  @override
  Future<Post> addPost() {
    // TODO: implement addPost
    throw UnimplementedError();
  }
}
