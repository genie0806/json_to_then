import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('매운맛 네트워크 통신'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                http
                    .get('https://jsonplaceholder.typicode.com/todos/1')
                    .then((response) {
                  print(response.statusCode);
                  print(response.body);

                  Map<String, dynamic> jsonResponse =
                      convert.jsonDecode(response.body);
                  String title = jsonResponse['title'];
                  print(title);

                  setState(() {
                    _result = title;
                  });
                });
              },
              child: Text('가져오기'),
            ),
          ),
          Text(_result)
        ],
      ),
    );
  }
}
