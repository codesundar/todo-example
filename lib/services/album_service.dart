import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todoapp/model/album.dart';
import 'package:todoapp/utils/constants.dart';

class AlbumService {
  Future<Album> fetchAlbum() async {
    var response = await http.get(Uri.parse("${AppConstants().url}/albums/1"));
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
