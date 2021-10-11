import 'package:nfadhil_blog/core/resource.dart';
import 'package:nfadhil_blog/domain/entities/blog.dart';

abstract class BlogRepository {

  Future<Resource<List<Blog>>> getAllBlog({String searchKey  = ""});

  Future<Resource<Blog>> getOneBlogById(int id);


}