import 'package:hive/hive.dart';
import 'package:nfadhil_blog/core/errors/exceptions.dart';
import 'package:nfadhil_blog/data/local/datasources/abstract/blog_local_data_source.dart';
import 'package:nfadhil_blog/data/local/models/blog_entity.dart';
import 'package:nfadhil_blog/domain/entities/blog.dart';

class BlogLocalDataSourceImpl implements BlogLocalDataSource {
  final Box<BlogEntity> _hiveBox;

  BlogLocalDataSourceImpl(this._hiveBox);

  @override
  Future<void> addBunchOfBlog(List<Blog> blogEntityList) async {
    await _hiveBox.addAll(
        blogEntityList.map((e) => BlogEntity.fromDomainModel(e)).toList());
  }

  @override
  Future<void> addNewBlog(Blog blog) async {
    await _hiveBox.put(blog.id, BlogEntity.fromDomainModel(blog));
  }

  @override
  Future<List<Blog>> getAllBlog() async {
    return _hiveBox.values.toList().map((e) => e.toDomainModel()).toList();
  }

  @override
  Future<Blog> getBlogById(int id) async {
    final resultOfSearchById = _hiveBox.get(id)?.toDomainModel();
    if (resultOfSearchById != null) {
      return resultOfSearchById;
    }
    throw CacheException("No blog with such id");
  }
}
