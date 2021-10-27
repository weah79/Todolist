import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController todo_title = TextEditingController();
  TextEditingController todo_detail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เพิ่มรายการใหม่'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextField(
              controller: todo_title,
              decoration: InputDecoration(
                  labelText: 'รายการ', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              minLines: 4,
              maxLines: 8,
              controller: todo_detail,
              decoration: InputDecoration(
                  labelText: 'รายละเอียด', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  print('----------------');
                  print('title : ${todo_title.text}');
                  print('detail : ${todo_detail.text}');
                  postTodo();
                  setState(() {
                    todo_title.clear();
                    todo_detail.clear();
                  });
                },
                child: Text("เพิ่มรายการ"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightBlue[400]),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(50, 20, 50, 20)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future postTodo() async {
    //var url = Uri.https('f5a9-184-22-247-211.ngrok.io', '/api/post-todolist');
    var url = Uri.http('192.168.1.101:8000', '/api/post-todolist');
    Map<String, String> header = {"Content-type": "application/json"};
    String jsondata =
        '{"title": "${todo_title.text}", "detail": "${todo_detail.text}"}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('-------result--------');
    // print(response.body);
  }
}
