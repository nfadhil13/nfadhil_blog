import '../../../../domain/entities/blog.dart';

abstract class BlogLocalDataSource {
  Future<void> addNewBlog(Blog blog);

  Future<void> addBunchOfBlog(List<Blog> blogList);

  Future<List<Blog>> getAllBlog();

  Future<Blog> getBlogById(int id);
}
