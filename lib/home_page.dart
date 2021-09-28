import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:network_sample/model/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _result = '';

//최초의 로드될때
  @override
  void initState() {
    super.initState();

    init();
  }

  void init() async {
    Todo todo = await fetch();
    setState(() {
      _result = todo.title;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
                fetch();
              },
              child: Text('가져오기'),
            ),
          ),
          Text(_result),
        ],
      ),
    );
  }

  Future<Todo> fetch() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/todos/1');
    print(response.statusCode);
    print(response.body);

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    //String title = jsonResponse['title'];

    Todo todo = Todo.fromJson(jsonResponse);
    return todo;
  }
}
