import 'package:hive/hive.dart';

import '../../../domain/entities/blog.dart';
import '../base_model.dart';
import '../hive_sequence.dart';

part 'blog_entity.g.dart';

@HiveType(typeId: HiveSequence.blog)
class BlogEntity extends BaseEntity<Blog> {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String content;

  @HiveField(3)
  final String imagePreviewURL;

  @HiveField(4)
  final String releaseDate;

  BlogEntity(
      {required this.id,
      required this.title,
      required this.content,
      required this.imagePreviewURL,
      required this.releaseDate});

  @override
  Blog toDomainModel() {
    return Blog(
        id: id,
        title: title,
        content: content,
        imagePreviewURL: imagePreviewURL,
        releaseDate: releaseDate);
  }

  static BlogEntity fromDomainModel(Blog blog) {
    return BlogEntity(
        id: blog.id,
        title: blog.title,
        content: blog.content,
        imagePreviewURL: blog.imagePreviewURL,
        releaseDate: blog.releaseDate);
  }
}
