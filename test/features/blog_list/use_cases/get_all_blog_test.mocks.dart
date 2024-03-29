// Mocks generated by Mockito 5.0.16 from annotations
// in nfadhil_blog/test/features/blog_list/use_cases/get_all_blog_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:nfadhil_blog/core/resource.dart' as _i2;
import 'package:nfadhil_blog/domain/entities/blog.dart' as _i5;
import 'package:nfadhil_blog/domain/repositories/blog_repo.dart' as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeResource_0<T> extends _i1.Fake implements _i2.Resource<T> {}

/// A class which mocks [BlogRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBlogRepository extends _i1.Mock implements _i3.BlogRepository {
  MockBlogRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Resource<List<_i5.Blog>>> getAllBlog(
          {String? searchKey = r''}) =>
      (super.noSuchMethod(
              Invocation.method(#getAllBlog, [], {#searchKey: searchKey}),
              returnValue: Future<_i2.Resource<List<_i5.Blog>>>.value(
                  _FakeResource_0<List<_i5.Blog>>()))
          as _i4.Future<_i2.Resource<List<_i5.Blog>>>);
  @override
  _i4.Future<_i2.Resource<_i5.Blog>> getOneBlogById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getOneBlogById, [id]),
              returnValue: Future<_i2.Resource<_i5.Blog>>.value(
                  _FakeResource_0<_i5.Blog>()))
          as _i4.Future<_i2.Resource<_i5.Blog>>);
  @override
  _i4.Future<_i2.Resource<T>> networkAndCacheCall<T>(
          {_i4.Future<bool>? isNetworkConnected,
          _i4.Future<_i2.Resource<T>> Function()? onConnectionExist,
          _i4.Future<_i2.Resource<T>> Function()? onConnectionNotExist,
          bool? getFromCacheIfNetworkError = false}) =>
      (super.noSuchMethod(
              Invocation.method(#networkAndCacheCall, [], {
                #isNetworkConnected: isNetworkConnected,
                #onConnectionExist: onConnectionExist,
                #onConnectionNotExist: onConnectionNotExist,
                #getFromCacheIfNetworkError: getFromCacheIfNetworkError
              }),
              returnValue: Future<_i2.Resource<T>>.value(_FakeResource_0<T>()))
          as _i4.Future<_i2.Resource<T>>);
  @override
  _i4.Future<_i2.Resource<T>> cacheOnlyCall<T>(
          {_i4.Future<_i2.Resource<T>> Function()? cacheCall}) =>
      (super.noSuchMethod(
              Invocation.method(#cacheOnlyCall, [], {#cacheCall: cacheCall}),
              returnValue: Future<_i2.Resource<T>>.value(_FakeResource_0<T>()))
          as _i4.Future<_i2.Resource<T>>);
  @override
  String toString() => super.toString();
}
