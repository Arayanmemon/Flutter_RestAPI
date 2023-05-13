import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/image_upload.dart';
import 'Models/PostsModel.dart';
import 'login_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<PostsModel> postList = [];

  Future<List<PostsModel>> getPost() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    final data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      postList.clear();
      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }
    else{
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:ImageUpload(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('data'),
      //   ),
      //   body: FutureBuilder(
      //       future: getPost(),
      //       builder: (context, snapshot){
      //     if(!snapshot.hasData){
      //       return Text('Loading...');
      //     }
      //     else{
      //       return ListView.builder(
      //           itemCount: postList.length,
      //           itemBuilder: (context, index){
      //             const bool todo = false;
      //           return Column(
      //             children: [
      //               ListTile(
      //                 leading: Text(postList[index].id.toString()),
      //                 title: Text(postList[index].title.toString()),
      //                 subtitle:
      //                 // Text(postList[index].completed.toString())
      //                 postList[index].completed ?? false ? Icon(Icons.done) : Icon(Icons.incomplete_circle)
      //               ),
      //               Divider()
      //             ],
      //           );
      //       });
      //     }
      //   }),
      // ),
    );
  }
}

