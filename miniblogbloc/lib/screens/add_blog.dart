import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:miniblog/blocs/article_bloc/article_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_event.dart';
import 'package:miniblog/blocs/article_bloc/article_state.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({Key? key}) : super(key: key);

  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  @override
  void initState() {
    super.initState();
    //context.read<ArticleBloc>().add(ResetFetchArticleAdd());
  }

  final _formKey = GlobalKey<FormState>();
  final ImagePicker imagePicker = ImagePicker();
  XFile? selectedImage;
  XFile? selectedFile;
  String title = "";
  String content = "";
  String author = "";

  // pickImage() async {
  //   selectedFile = await imagePicker.pickImage(source: ImageSource.gallery);
  // }
  pickImage() async {
    XFile? selectedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = selectedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Yeni Blog Ekle")),
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    if (selectedImage != null)
                      Image.file(File(selectedImage!.path)),
                    ElevatedButton(
                        onPressed: () {
                          pickImage();
                        },
                        child: const Text("Fotoğraf Seç")),
                    TextFormField(
                      decoration:
                          const InputDecoration(label: Text("Blog Başlığı")),
                      onSaved: (newValue) {
                        title = newValue!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Lütfen bir blog başlığı giriniz";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(label: Text("Blog İçeriği")),
                      maxLines: 5,
                      onSaved: (newValue) {
                        content = newValue!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Lütfen bir blog içeriği giriniz";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(label: Text("Ad Soyad")),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Lütfen ad soyad başlığı giriniz";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        author = newValue!;
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // formun valid olduğu durum
                            _formKey.currentState!.save();

                            context.read<ArticleBloc>().add(AddArticle(
                                selectedImage: selectedImage,
                                title: title,
                                content: content,
                                author: author));
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Blog Ekle"))
                  ],
                ),
              ),
            );
          },
        ));
  }
}
