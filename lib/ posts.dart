import 'package:flutter/material.dart';
import 'http_service.dart';
import 'post_model.dart';
import 'post.detail.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Al Quran"),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post>? posts = snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.all(8.0), // Padding untuk ListView
              itemCount: posts!.length,
              itemBuilder: (BuildContext context, int index) {
                Post post = posts[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0), // Jarak antar Card
                  child: Card(
                    elevation: 4, // Memberikan bayangan
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Membulatkan sudut Card
                    ),
                    child: ListTile( 
                      title: Text("Nama: ${post.nama}\n Surah ke: ${post.nomor}"),
                      subtitle: Text("Nama Latin: ${post.nama_latin}\nJumlah Ayat: ${post.jumlah_ayat}"),
                      onTap: () =>  Navigator.of(context).push
                      (MaterialPageRoute(builder: (context) => PostDetail(post: post) )),
                      
                      // trailing: Icon(Icons.arrow_forward),
                      // onTap: () => Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) => SuratDetail(surat: post) )
                      // ),
                    ),
                    
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator.adaptive());
          }
        },
      ),
    );
  }
}