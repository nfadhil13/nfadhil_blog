import '../../../../domain/entities/blog.dart';

abstract class BlogLocalDataSource {
  Future<void> addNewBlog(Blog blogEntity);

  Future<void> addBunchOfBlog(List<Blog> blogEntityList);

  Future<List<Blog>> getAllBlog();

  Future<Blog> getBlogById(int id);
}
