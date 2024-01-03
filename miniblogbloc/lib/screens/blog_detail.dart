import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/article_detail_bloc/article_detail_bloc.dart';
import 'package:miniblog/blocs/article_detail_bloc/article_detail_event.dart';
import 'package:miniblog/blocs/article_detail_bloc/article_detail_state.dart';

class BlogDetail extends StatefulWidget {
  const BlogDetail({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  _BlogDetailState createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  @override
  void initState() {
    super.initState();
    context.read<ArticleDetailBloc>().add(ResetFetchArticleDetail());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ArticleDetailBloc, ArticleDetailState>(
          builder: (context, state) {
            if (state is ArticleDetailLoaded) {
              return Text(state.blog.title!);
            }
            return const Text("Detay Sayfası");
          },
        ),
      ),
      body: BlocBuilder<ArticleDetailBloc, ArticleDetailState>(
        builder: (context, state) {
          if (state is ArticleDetailInitial) {
            context
                .read<ArticleDetailBloc>()
                .add(FetchArticleDetailEvent(id: widget.id));
            return const Center(child: Text("İstek atılıyor.."));
          }

          if (state is ArticleDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ArticleDetailLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.blog.thumbnail != null)
                    Image.network(
                      state.blog.thumbnail!,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  const SizedBox(height: 8),
                  Text(
                    state.blog.author!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.blog.content!,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }

          return const Center(
            child: Text("Bilinmedik durum"),
          );
        },
      ),
    );
  }
}
