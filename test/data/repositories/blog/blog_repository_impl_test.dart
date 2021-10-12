import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nfadhil_blog/core/errors/base_error.dart';
import 'package:nfadhil_blog/core/errors/exceptions.dart';
import 'package:nfadhil_blog/core/platform/network_info.dart';
import 'package:nfadhil_blog/core/resource.dart';
import 'package:nfadhil_blog/data/local/datasources/abstract/blog_local_data_source.dart';
import 'package:nfadhil_blog/data/remote/datasources/abstract/blog_network_data_source.dart';
import 'package:nfadhil_blog/data/repositories/blog_repository_impl.dart';
import 'package:nfadhil_blog/domain/entities/blog.dart';

import 'blog_repository_impl_test.mocks.dart';

@GenerateMocks([BlogNetworkDataSource, BlogLocalDataSource, NetworkInfo])
void main() {
  group("Testing Blog Repository", () {
    late BlogRepositoryImpl blogRepositoryImpl;
    late BlogLocalDataSource blogLocalDataSource;
    late BlogNetworkDataSource blogNetworkDataSource;
    late NetworkInfo networkInfo;
    late List<Blog> networkBlog;
    late List<Blog> cacheBlog;

    setUp(() {
      blogLocalDataSource = MockBlogLocalDataSource();
      blogNetworkDataSource = MockBlogNetworkDataSource();
      networkInfo = MockNetworkInfo();
      blogRepositoryImpl = BlogRepositoryImpl(
          blogLocalDataSource, blogNetworkDataSource, networkInfo);

      networkBlog = [
        const Blog(
            id: 1,
            title: "Blog 1",
            content: "Halo",
            imagePreviewURL: "",
            releaseDate: ""),
        const Blog(
            id: 2,
            title: "Blog 2",
            content: "Halo",
            imagePreviewURL: "",
            releaseDate: ""),
        const Blog(
            id: 3,
            title: "Blog 3",
            content: "Halo",
            imagePreviewURL: "",
            releaseDate: "")
      ];

      cacheBlog = [];
    });

    // ! Test getBlogById
    group("""
      \nTest getAllBlog Method
    """, () {
      final serverException =
          ServerException("Gagal mendapatkan data dari server");
      setUp(() {
        when(blogLocalDataSource.getAllBlog())
            .thenAnswer((realInvocation) async => cacheBlog);
      });
      group("When Connection Is Exist", () {
        setUp(() {
          when(networkInfo.isConnected).thenAnswer((_) async => true);
        });

        // ! Getting API Success Test
        test("Test when getting frorm api is success", () async {
          //Arrange
          when(blogNetworkDataSource.getAllBlog())
              .thenAnswer((_) async => networkBlog);
          when(blogLocalDataSource.addBunchOfBlog(networkBlog))
              .thenAnswer((realInvocation) async {
            cacheBlog.addAll(networkBlog);
          });
          //Act
          await blogRepositoryImpl.getAllBlog();

          verify(blogNetworkDataSource.getAllBlog());
          verify(blogLocalDataSource.addBunchOfBlog(networkBlog));
          // Test if blog from network blog already on cache
          expect(networkBlog, await blogLocalDataSource.getAllBlog());
        });

        // ! Getting Api Error
        test("Test when getting frorm api is error", () async {
          //Arrange
          when(blogNetworkDataSource.getAllBlog())
              .thenAnswer((_) async => throw serverException);
          when(blogLocalDataSource.addBunchOfBlog(networkBlog))
              .thenAnswer((realInvocation) async {
            cacheBlog.addAll(networkBlog);
          });
          //Act
          final result = await blogRepositoryImpl.getAllBlog();

          verify(blogNetworkDataSource.getAllBlog());
          verifyZeroInteractions(blogLocalDataSource);

          // Test if result return server exception
          expect(Error<List<Blog>>(error: ServerError(serverException.message)),
              result);

          //Test if cach is still null and no data inserted
          expect([], await blogLocalDataSource.getAllBlog());
        });
      });
    });

    // ! Test getBlogById
    group("""
      \nTest getBlogById
    """, () {
      const singleBlog = Blog(
          id: 1,
          title: "Blog 1",
          content: "Halo",
          imagePreviewURL: "",
          releaseDate: "");
      const tobeSearchId = 1;
      final getBlogServerException = ServerException("No Blog Found");
      final getBlogLocalException = CacheException("No Blog with Such ID");
      setUp(() {
        when(blogLocalDataSource.getBlogById(tobeSearchId))
            .thenAnswer((realInvocation) async {
          try {
            return cacheBlog
                .firstWhere((element) => element.id == tobeSearchId);
          } catch (exception) {
            throw getBlogLocalException;
          }
        });
      });

      group("When Connection Is Exist", () {
        setUp(() {
          when(networkInfo.isConnected).thenAnswer((_) async => true);
        });

        // ! Getting API Success Test
        test("Test when getting frorm api is success", () async {
          //Arrange
          when(blogNetworkDataSource.getOneBlogById(tobeSearchId))
              .thenAnswer((_) async => singleBlog);

          when(blogLocalDataSource.addNewBlog(singleBlog))
              .thenAnswer((realInvocation) async {
            cacheBlog.add(singleBlog);
          });

          //Act
          await blogRepositoryImpl.getOneBlogById(tobeSearchId);

          verify(blogNetworkDataSource.getOneBlogById(tobeSearchId));
          verify(blogLocalDataSource.addNewBlog(singleBlog));

          // Test if blog from network blog already on cache
          expect(
              singleBlog, await blogLocalDataSource.getBlogById(tobeSearchId));
        });

        // ! Getting Api Error
        test("Test when getting frorm api is error", () async {
          when(blogNetworkDataSource.getOneBlogById(tobeSearchId))
              .thenAnswer((_) async => throw getBlogServerException);

          //Act
          final result = await blogRepositoryImpl.getOneBlogById(tobeSearchId);

          verify(blogNetworkDataSource.getOneBlogById(tobeSearchId));
          verifyZeroInteractions(blogLocalDataSource);

          // Test if blog from network  not on the cache
          expect([], cacheBlog);

          // Test if result return server Exception
          expect(
              Error<Blog>(error: ServerError(getBlogServerException.message)),
              result);
        });
      });
    });
  });
}
