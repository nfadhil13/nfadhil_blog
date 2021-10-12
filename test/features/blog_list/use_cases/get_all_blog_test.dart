import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nfadhil_blog/core/resource.dart';
import 'package:nfadhil_blog/core/use_case.dart';
import 'package:nfadhil_blog/domain/entities/blog.dart';
import 'package:nfadhil_blog/domain/repositories/blog_repo.dart';
import 'package:nfadhil_blog/features/blog_list/use_cases/get_all_blog.dart';

import 'get_all_blog_test.mocks.dart';

@GenerateMocks([BlogRepository])
void main() {
  MockBlogRepository mockBlogRepository = MockBlogRepository();
  GetAllBlog usecase = GetAllBlog(mockBlogRepository);

  final blogList = Success(data: const [
    Blog(
        id: 1,
        title: "Blog 1",
        content: "Halo",
        imagePreviewURL: "",
        releaseDate: ""),
    Blog(
        id: 2,
        title: "Blog 2",
        content: "Halo",
        imagePreviewURL: "",
        releaseDate: ""),
    Blog(
        id: 3,
        title: "Blog 3",
        content: "Halo",
        imagePreviewURL: "",
        releaseDate: "")
  ]);

  test("Should get blog list from the repository", () async {
    when(mockBlogRepository.getAllBlog())
        .thenAnswer((realInvocation) async => blogList);

    final result = await usecase.call(NoParams());

    expect(result, blogList);

    verify(mockBlogRepository.getAllBlog());

    verifyNoMoreInteractions(mockBlogRepository);
  });
}
