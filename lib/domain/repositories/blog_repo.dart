import '../../core/base_repo.dart';
import '../../core/resource.dart';
import '../entities/blog.dart';

abstract class BlogRepository extends BaseRepository {
  Future<Resource<List<Blog>>> getAllBlog({String searchKey = ""});

  Future<Resource<Blog>> getOneBlogById(int id);
}
