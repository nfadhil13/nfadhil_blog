import '../../../../domain/entities/blog.dart';

abstract class BlogNetworkDataSource {
  Future<List<Blog>> getAllBlog({String searchKey = ""});

  Future<Blog> getOneBlogById(int id);
}
