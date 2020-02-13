
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture Hero"),
      ),
      body: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Hero(
                        tag: "me",
                        child: Image.asset('assets/images/me.jpg'),
                      ),
                      FlatButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () {
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text("some snacks")));
                        },
                        child: Text(
                          "Go to GestureOnRowRoute",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image(image: AssetImage('assets/images/me.jpg')),
                    SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    Text("BBBBBBBBBBBBB"),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
