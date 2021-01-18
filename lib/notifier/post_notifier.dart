
import 'package:base_provider_mvvm/models/post.dart';
import 'package:flutter/material.dart';

class PostNotifier with ChangeNotifier{
  List<Post> _postList = [];

  setPostList(List<Post> postList) {
    _postList = [];
    _postList = postList;
    notifyListeners();
  }

  List<Post> getPostList() {
    return _postList;
  }

}