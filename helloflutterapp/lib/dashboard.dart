import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  // Declare a field that holds the Todo.
  String todo;

  // In the constructor, require a Todo.
  DashboardPage({@required this.todo});

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 150),
          Padding(
            padding: EdgeInsets.all(30),
            child:  Stack(
              overflow: Overflow.visible,
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Positioned(
                  bottom: -50,
                  right: -50,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.blueAccent,
                    child: SizedBox(),
                  ),
                ),
                Opacity(
                  opacity: 1,
                  child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                      child: SizedBox()
                  ),
                ),
                Positioned(
                  top: -50,
                  left: -50,
                  child: Hero(
                    tag: "me",
                    child: Image.asset('assets/images/me.jpg' , height: 100),
                  ),
                ),
                Positioned(
                  bottom: 200,
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.cyan, fontSize: 30, fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(text: "Welcome "),
                          TextSpan(text: todo , style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blueAccent,
                              fontStyle: FontStyle.italic
                          ))
                        ]
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),

    );
  }
}
