import '../../../domain/entities/blog.dart';
import '../network_const.dart';

class BlogDto extends Blog {
  const BlogDto(
      {required int id,
      required String title,
      required String content,
      required String imagePreviewURL,
      required String releaseDate})
      : super(
            id: id,
            title: title,
            content: content,
            imagePreviewURL: imagePreviewURL,
            releaseDate: releaseDate);

  static BlogDto fromJson(Map<String, dynamic> jsonMap) {
    return BlogDto(
        id: jsonMap["id"],
        title: jsonMap["Title"],
        content: jsonMap["content"],
        imagePreviewURL: NetworkConst.baseUrl + jsonMap["cover"]["url"],
        releaseDate: jsonMap["published_at"]);
  }
}
