import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  // Declare a field that holds the Todo.
  String todo;

  // In the constructor, require a Todo.
  DetailPage({@required this.todo});

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo),
      ),
      body: Column(
        children: <Widget>[
          Hero(
            tag: "me",
            child: Image.asset('assets/images/me.jpg'),
          ),
          Text(
            "Trying being open-minded ?",
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
