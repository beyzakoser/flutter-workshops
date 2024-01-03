import 'package:image_picker/image_picker.dart';

abstract class ArticleEvent {}

class FetchArticles extends ArticleEvent {}

class AddArticle extends ArticleEvent {
  final XFile? selectedImage;
  final String? title;
  final String? content;
  final String? author;

  AddArticle(
      {required this.selectedImage,
      required this.title,
      required this.content,
      required this.author});
}

// class ResetFetchArticleAdd extends ArticleEvent {}
