import '../../../core/resource.dart';
import '../../../core/use_case.dart';
import '../../../domain/entities/blog.dart';
import '../../../domain/repositories/blog_repo.dart';

class SearchBlog extends UseCase<List<Blog>, String> {
  final BlogRepository _repository;

  SearchBlog(this._repository);

  @override
  Future<Resource<List<Blog>>> call(String params) async {
    return await _repository.getAllBlog(searchKey: params);
  }
}
