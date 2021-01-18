
import 'dart:convert';
import 'package:base_provider_mvvm/models/post.dart';
import 'package:base_provider_mvvm/notifier/post_notifier.dart';
import 'package:http/http.dart' as http;

class ApiServices{
  static const String API_ENDPOINT =
      "https://jsonplaceholder.typicode.com/posts";

  static getPosts(PostNotifier postNotifier) {
    List<Post> postList = [];
    http.get(API_ENDPOINT).then((response){
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
      }

      List posts = jsonDecode(response.body);
      posts.forEach((element) {
        postList.add(Post.fromMap(element));
      });
      print(postList.length);
      postNotifier.setPostList(postList);
    });
  }
}