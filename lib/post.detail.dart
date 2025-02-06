import 'package:flutter/material.dart';
import 'package:flutter_application_2/post_model.dart';


class PostDetail extends StatelessWidget {
  final Post post;

  PostDetail({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("${post.nomor}"),
            Text("${post.nama}"),
            Text("${post.nama_latin}"),
            Text("${post.jumlah_ayat}"),
            Text("${post.tempat_turun}"),
            Text("${post.arti}"),
            Text("${post.deskripsi}"),
          ],
        ),
      ),
    );
  }
}