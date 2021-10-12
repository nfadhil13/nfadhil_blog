import 'package:equatable/equatable.dart';

class Blog extends Equatable{
  final int id;
  final String title;
  final String content;
  final String imagePreviewURL;
  final String releaseDate;

  const Blog( {
    required this.id,
    required this.title,
    required this.content,
    required this.imagePreviewURL,
    required this.releaseDate
  });

  @override
  List<Object?> get props => [id,title,content];


}