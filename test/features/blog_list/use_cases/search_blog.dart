import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nfadhil_blog/core/resource.dart';
import 'package:nfadhil_blog/core/use_case.dart';
import 'package:nfadhil_blog/domain/entities/blog.dart';
import 'package:nfadhil_blog/domain/repositories/blog_repo.dart';
import 'package:nfadhil_blog/features/blog_list/get_all_blog.dart';
import 'package:nfadhil_blog/features/blog_list/search_blog.dart';

import 'get_all_blog_test.mocks.dart';

@GenerateMocks([BlogRepository])
void main() {

  MockBlogRepository mockBlogRepository = MockBlogRepository();
  SearchBlog usecase = SearchBlog(mockBlogRepository);


  final blogList = Success(data: const [
    Blog(id: "1", title: "Blog A", content: "Halo", imagePreviewURL: "", releaseDate: ""),
    Blog(id: "2", title: "Blog B", content: "Halo", imagePreviewURL: "", releaseDate: ""),
    Blog(id: "3", title: "Blog C", content: "Halo", imagePreviewURL: "", releaseDate: "")
  ]);

  test(
      "Should get blog list from the repository that contains title Blog",
          () async {
        when(mockBlogRepository.getAllBlog(searchKey: "Blog"))
            .thenAnswer((realInvocation) async => blogList);

        final result = await usecase.call("Blog");

        expect(result , blogList);

        verify(mockBlogRepository.getAllBlog(searchKey: "Blog"));

        verifyNoMoreInteractions(mockBlogRepository);
      }
  );

}