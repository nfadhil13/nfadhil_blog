import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nfadhil_blog/data/local/models/blog_entity.dart';
import 'package:nfadhil_blog/domain/entities/blog.dart';

void main() {
  final blogEntity = BlogEntity(
      id: 1,
      title: "Starting Blog",
      content: "Halo semuanya ini blog pertama saya. Saya harap kalian akan ",
      imagePreviewURL:
          "https://api.nfadhil.me/uploads/vuejs_seeklogo_com_7b8e33170b.svg",
      releaseDate: "2021-10-06T04:21:38.736Z");

  const blog = Blog(
      id: 1,
      title: "Starting Blog",
      content: "Halo semuanya ini blog pertama saya. Saya harap kalian akan ",
      imagePreviewURL:
          "https://api.nfadhil.me/uploads/vuejs_seeklogo_com_7b8e33170b.svg",
      releaseDate: "2021-10-06T04:21:38.736Z");

  test("Test Blog to BlogEntity Parse", () {
    final result = BlogEntity.fromDomainModel(blog);
    expect(result, isA<BlogEntity>());
    expect(result, blogEntity);
  });

  test("Test BlogEntity to Blog Parse", () {
    final result = blogEntity.toDomainModel();
    expect(result, isA<Blog>());
    expect(result, blog);
  });
}
