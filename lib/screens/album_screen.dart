import 'package:flutter/material.dart';
import 'package:todoapp/model/album.dart';
import 'package:todoapp/services/album_service.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum = AlbumService().fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Album")),
      body: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snap) {
          if (snap.hasData) {
            return Text(snap.data!.title);
          } else if (snap.hasError) {
            return Text("${snap.error}");
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
