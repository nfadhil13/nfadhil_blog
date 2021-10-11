import 'package:nfadhil_blog/core/resource.dart';
import 'package:nfadhil_blog/core/use_case.dart';
import 'package:nfadhil_blog/domain/entities/blog.dart';
import 'package:nfadhil_blog/domain/repositories/blog_repo.dart';

class GetAllBlog extends UseCase<List<Blog>, NoParams>{
  final BlogRepository _repository;

  GetAllBlog(this._repository);

  @override
  Future<Resource<List<Blog>>> call(NoParams params) async{
    return await _repository.getAllBlog();
  }
}