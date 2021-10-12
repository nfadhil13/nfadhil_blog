import '../../core/network/network_info.dart';
import '../../core/resource.dart';
import '../../domain/entities/blog.dart';
import '../../domain/repositories/blog_repo.dart';
import '../local/datasources/abstract/blog_local_data_source.dart';
import '../remote/datasources/abstract/blog_network_data_source.dart';

class BlogRepositoryImpl extends BlogRepository {
  final BlogLocalDataSource _blogLocalDataSource;
  final BlogNetworkDataSource _blogNetworkDataSource;
  final NetworkInfo networkInfo;

  BlogRepositoryImpl(
      this._blogLocalDataSource, this._blogNetworkDataSource, this.networkInfo);

  @override
  Future<Resource<List<Blog>>> getAllBlog({String searchKey = ""}) async =>
      networkAndCacheCall(
          isNetworkConnected: networkInfo.isConnected,
          onConnectionExist: () async {
            final networkResult =
                await _blogNetworkDataSource.getAllBlog(searchKey: searchKey);
            await _blogLocalDataSource.addBunchOfBlog(networkResult);
            return Success(data: networkResult);
          },
          onConnectionNotExist: () async {
            return Success(data: (await _blogLocalDataSource.getAllBlog()));
          });

  @override
  Future<Resource<Blog>> getOneBlogById(int id) async => networkAndCacheCall(
      isNetworkConnected: networkInfo.isConnected,
      onConnectionExist: () async {
        final networkResult = await _blogNetworkDataSource.getOneBlogById(id);
        await _blogLocalDataSource.addNewBlog(networkResult);
        return Success(data: networkResult);
      },
      onConnectionNotExist: () async {
        return Success(data: (await _blogLocalDataSource.getBlogById(id)));
      });
}
