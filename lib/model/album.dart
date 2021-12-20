import 'dart:convert';
import 'package:http/http.dart' as http;

class Album {
  // final int userId;
  // final int id;
  // final String title;
  final String tags;
  final String previewURL;

  Album({
    required this.previewURL,
    required this.tags
    // required this.userId,
    // required this.id,
    // required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      tags: json['tags'],
      previewURL: json['previewURL']
      // userId: json['userId'],
      // id: json['id'],
      // title: json['title'],
    );
  }

  static List<Album> listToAlbums(List jsonlist) {
    return jsonlist.map((e) => Album.fromJson(e)).toList();
  }

  @override
  String toString() {
    return 'Album{tags: $tags, previewURL: $previewURL}';
  }
}