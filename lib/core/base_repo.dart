import 'errors/base_error.dart';
import 'errors/exceptions.dart';
import 'resource.dart';

abstract class BaseRepository {
  Future<Resource<T>> networkAndCacheCall<T>(
      {
        required Future<bool> isNetworkConnected,
        required Future<Resource<T>> Function() onConnectionExist,
        required Future<Resource<T>> Function() onConnectionNotExist,
        bool getFromCacheIfNetworkError = false
      }) async {
    try {
      if (await isNetworkConnected) {
        return await onConnectionExist();
      } else {
        return await onConnectionNotExist();
      }
    } on ServerException catch (e) {
      return getFromCacheIfNetworkError ? await cacheOnlyCall(cacheCall: onConnectionNotExist) : Error(error: ServerError(e.message));
    } on CacheException catch (e) {
      return Error(error: CacheError(e.message));
    }
  }

  Future<Resource<T>> cacheOnlyCall<T>(
      {required Future<Resource<T>> Function() cacheCall}) async {
    try {
      return await cacheCall();
    } on CacheException catch (e) {
      return Error(error: CacheError(e.message));
    } catch (e) {
      return Error(error: const UnknownError("Error tidak diketahui"));
    }
  }
}
