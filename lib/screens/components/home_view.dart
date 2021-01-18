import 'package:base_provider_mvvm/models/post.dart';
import 'package:flutter/material.dart';

import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  final Post post;

  HomeView({@required this.post});

  @override
  _HomeViewState createState(){
    return _HomeViewState(post);
  }
}

class _HomeViewState extends State<HomeView> {
  Post post;
  HomeViewModel homeViewModel;

  _HomeViewState(this.post) {
    homeViewModel = new HomeViewModel();
    homeViewModel.setPost(post);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Expanded(
                        flex: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            homeViewModel.post.id.toString(),
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            homeViewModel.post.title,
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                ),
              ),
              Divider(
                height: 1,
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  homeViewModel.post.body,
                ),
              )
            ],
          )),
    );
  }
}
