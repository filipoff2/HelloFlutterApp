import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detailPage.dart';

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
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 150),
            Padding(
              padding: EdgeInsets.all(30),
              child:  Stack(
                overflow: Overflow.visible,
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Positioned(
                    top: -50,
                    left: -50,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.blueAccent,
                      child: SizedBox(),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    right: -50,
                    child: Opacity(
                      opacity: 1,
                      child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.green,
                          child: SizedBox()
                      ),
                    ),
                  ),
                  Positioned(
                    child: Hero(
                      tag: "me",
                      child: Image.asset('assets/images/me.jpg', height: 100),
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
            SizedBox(height: 40),
            RichText(
                text: TextSpan(
                    style: TextStyle(fontStyle: FontStyle.normal,color: Colors.black, fontSize: 23
                    ),
                    children: <TextSpan>[
                      TextSpan(text: '.Net developer', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.purpleAccent
                      )),
                      TextSpan(text: " in ", style: TextStyle(
                      )),
                      TextSpan(text: 'Flutter', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.purpleAccent
                      ))
                    ]
                )
            ),
            Text(
              'Zaaap..',
              style: TextStyle(fontFamily: 'Bombing',height: 10, fontWeight: FontWeight.bold,),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Do I think cross-platform ?'),
              onPressed: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPage(todo: todo)),
                );

              },
            ),

          ],
        ),
      ),

    );
  }
}
