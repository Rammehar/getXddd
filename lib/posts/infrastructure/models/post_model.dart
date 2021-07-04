import 'package:sample_flutter_ddd_getx/posts/domain/entities/post.dart';

class PostModel extends Post {
  PostModel({required title, required bodyText})
      : super(title: title, bodyText: bodyText);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    //  final t = Title.create(json['title']);
    //final b = BodyText.create(json['body']);
    final title = json['title'];
    final bodyText = json['body'];
    return PostModel(title: title, bodyText: bodyText);
  }
}
