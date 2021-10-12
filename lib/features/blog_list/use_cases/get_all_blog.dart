import '../../../core/resource.dart';
import '../../../core/use_case.dart';
import '../../../domain/entities/blog.dart';
import '../../../domain/repositories/blog_repo.dart';

class GetAllBlog extends UseCase<List<Blog>, NoParams> {
  final BlogRepository _repository;

  GetAllBlog(this._repository);

  @override
  Future<Resource<List<Blog>>> call(NoParams params) async {
    return await _repository.getAllBlog();
  }
}
