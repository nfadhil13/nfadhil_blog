import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nfadhil_blog/data/local/datasources/abstract/blog_local_data_source.dart';
import 'package:nfadhil_blog/data/local/datasources/impl/blog_local_data_source_impl.dart';
import 'package:nfadhil_blog/data/local/models/blog_entity.dart';

class BlogEntityBoxMock extends Mock implements Box<BlogEntity> {}

void main() {
  late BlogEntityBoxMock blogEntityBoxMock;
  late BlogLocalDataSourceImpl blogLocalDataSourceImpl;
  late List<BlogEntity> blogEntityList;

  setUp(() {
    blogEntityBoxMock = BlogEntityBoxMock();
    blogLocalDataSourceImpl = BlogLocalDataSourceImpl(blogEntityBoxMock);
    blogEntityList = [
      BlogEntity(
          id: 1,
          title: "Blog 1",
          content: "Halo",
          imagePreviewURL: "",
          releaseDate: ""),
      BlogEntity(
          id: 2,
          title: "Blog 2",
          content: "Halo",
          imagePreviewURL: "",
          releaseDate: ""),
      BlogEntity(
          id: 3,
          title: "Blog 3",
          content: "Halo",
          imagePreviewURL: "",
          releaseDate: "")
    ];
  });

  test(("Test if hive box mock properly"), () {
    expect(blogLocalDataSourceImpl, isA<BlogLocalDataSource>());
    expect(blogEntityBoxMock, isA<Box<BlogEntity>>());
  });

  test(("Test getAllBlog function"), () async {
    when(blogEntityBoxMock.toMap()).thenAnswer((_) {
      return blogEntityList.asMap();
    });
    final result = await blogLocalDataSourceImpl.getAllBlog();
    expect(blogEntityList.map((e) => e.toDomainModel()), result);
  });
}
