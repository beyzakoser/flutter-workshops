import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miniblog/models/blog.dart';
import 'package:http/http.dart' as http;

class ArticleRepository {
  Future<List<Blog>> fetchBlogs() async {
    Uri url = Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles");
    final response = await http.get(url);
    final List jsonData = json.decode(response.body);
    return jsonData.map((json) => Blog.fromJson(json)).toList();
  }

  Future<Blog> fetchBlogById(String id) async {
    Uri url =
        Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles/" + id);
    final response = await http.get(url);
    final body = json.decode(response.body);
    return Blog.fromJson(body);
  }

  Future<bool> addBlog(XFile? selectedImage, String? title, String? content,
      String? author) async {
    Uri url = Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles");

    var request = http.MultipartRequest("POST", url);

    request.fields['Title'] = title!;
    request.fields['Content'] = content!;
    request.fields['Author'] = author!;
    if (selectedImage != null) {
      final file =
          await http.MultipartFile.fromPath("File", selectedImage.path);
      request.files.add(file);
    }
    final response = await request.send();

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    } else {
      return false;
    }
  }
}
