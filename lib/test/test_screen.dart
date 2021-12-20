import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_search/model/album.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  // Album? _album;
  //
  // Future<void> init() async {
  //   Album album = await fetchAlbum();
  //   setState(() {
  //     _album = album;
  //   });
  // }

  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  // 오래 걸리는 처리
  // Future<http.Response> fetchAlbum() {
  //   return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  // }

  // future builder 를 사용할 경우, initState 를 없애도 됨.
  // @override
  // void initState() {
  //   super.initState();
  //
  //   init();
  // }
    // fetchAlbum().then((album) {
    //   setState(() {
    //     _album = album;
    //   });
    // });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Network Sample"),
      ),
      body: FutureBuilder<Album>(
        future: fetchAlbum(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('네트워크 에러!'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('데이터가 없습니다!'));
          }

          final Album album = snapshot.data!;

          return _buildBody(album);
        },
      ),
      // body: _album == null
      //     ? const Center(child: CircularProgressIndicator())
      //     : Text(
      //   '${_album!.id} : ${_album.toString()}',
      //   style: const TextStyle(fontSize: 30),
      // ),
    );
  }

  Widget _buildBody(Album album){
    return  Text(
      // '${album.id} : ${_album.toString()}',
      '${album.id} : ${album.toString()}',
      style: const TextStyle(fontSize: 30),
    );
  }
}
