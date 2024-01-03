import 'package:miniblog/models/blog.dart';

abstract class ArticleState {}

abstract class ArticleActionState extends ArticleState {}

class ArticlesInitial extends ArticleState {}

class ArticlesLoading extends ArticleState {}

class ArticlesLoaded extends ArticleState {
  final List<Blog> blogs;

  ArticlesLoaded({required this.blogs});
}

class ArticlesError extends ArticleState {}

class ArticleAdded extends ArticleState {}

class ArticleAddedError extends ArticleState {}
