import 'package:base_provider_mvvm/models/post.dart';

class HomeViewModel  {
  Post _post;

  setPost(Post post) {
    _post = post;
  }

  Post get post => _post;
}
