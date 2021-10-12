import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nfadhil_blog/data/remote/models/blog_dto.dart';
import 'package:nfadhil_blog/domain/entities/blog.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tBlogDto = BlogDto(
      id: 1,
      title: "Starting Blog",
      content: "Halo semuanya ini blog pertama saya. Saya harap kalian akan ",
      imagePreviewURL:
          "https://api.nfadhil.me/uploads/vuejs_seeklogo_com_7b8e33170b.svg",
      releaseDate: "2021-10-06T04:21:38.736Z");

  test("""
      \nTest Case : Make Sure that BlogDto is Subclass / Extens Blog Entity
      Input : BlogDto
      Expected Output : true
    """, () async {
    expect(tBlogDto, isA<Blog>());
  });

  group("Testing Json Parsing Method of BlogDto", () {
    test("""
        \nTest Case : Make Sure that Parsing BlogDto is success
        Input : JSON of expected BlogDto
        Expected Output : Valid BlogDto
      """, () async {
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture("blog_json/blog.json"));

      final result = BlogDto.fromJson(jsonMap);

      expect(result, tBlogDto);
    });
  });
}
