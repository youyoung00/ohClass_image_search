import 'package:flutter/material.dart';
import 'package:image_search/data/fake_data.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("이미지 검색"),
      ),
      body: Column(
        children:  [
          const TextField(
            // focusNode: _focus,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: "검색어를 입력하세요",
                border: InputBorder.none,
                icon: Padding(
                    padding: EdgeInsets.only(left: 13),
                    child: Icon(Icons.search)
                ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: fakePhotos.map((e) => Image.network(
                e.previewURL,
                fit: BoxFit.cover,
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
