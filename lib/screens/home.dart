
import 'package:base_provider_mvvm/models/post.dart';
import 'package:base_provider_mvvm/screens/components/home_view.dart';
import 'package:base_provider_mvvm/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:base_provider_mvvm/notifier/post_notifier.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    PostNotifier postNotifier =
    Provider.of<PostNotifier>(context, listen: false);
    ApiServices.getPosts(postNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PostNotifier postNotifier = Provider.of<PostNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body:
      postNotifier != null
      ? Container(
        color: Colors.black12,
        child: ListView.builder(
            itemCount: postNotifier.getPostList().length,
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: EdgeInsets.all(0),
                key: ObjectKey(postNotifier.getPostList()[index]),
                child: HomeView(
                  post: postNotifier.getPostList()[index],
                ),
              );
            }
        ),)
          : Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}

