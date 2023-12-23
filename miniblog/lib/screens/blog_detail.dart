import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:miniblog/models/blog.dart';
import "package:http/http.dart" as http;

class BlogDetailScreen extends StatefulWidget {
  const BlogDetailScreen({super.key, required this.blog});
  final Blog blog;

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  Blog? requestBlog = Blog();

  @override
  void initState() {
    super.initState();
    // http paketi ile istek
    fetchBlogs();
  }

  fetchBlogs() async {
    Uri url = Uri.parse(
        "https://tobetoapi.halitkalayci.com/api/Articles/${widget.blog.id}");
    final response = await http.get(url);
    final jsonData = json.decode(response.body);

    setState(() {
      requestBlog = Blog.fromJson(jsonData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(requestBlog?.title ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (requestBlog?.thumbnail != null)
              Image.network(
                requestBlog?.thumbnail ?? '',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 8),
            Text(
              requestBlog?.author ?? '',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            // Diğer blog içeriği alanları...
            Text(
              requestBlog?.content ?? '',
              style: const TextStyle(
                fontSize: 16,
                //color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
