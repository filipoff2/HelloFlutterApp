import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:helloflutterapp/providers/StarsCounter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class DetailPage extends StatelessWidget {
  // Declare a field that holds the Todo.
  String todo;

  // In the constructor, require a Todo.
  DetailPage({@required this.todo});

  @override
  Widget build(BuildContext context) {
    var data = [
      ClicksPerYear('Flash', 15, Colors.red),
      ClicksPerYear('JAVA', 50, Colors.deepOrange),
      ClicksPerYear('.NET', 90, Colors.blue),
      ClicksPerYear('ASP', 60, Colors.blue),
      ClicksPerYear('Desc', 60, Colors.blue),
      ClicksPerYear('Xamarin ', 70, Colors.blue),
      ClicksPerYear('Flutter', 10, Colors.purple)
    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    var stars = FavoriteWidget();
    //stars.toggleFavorite(3);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (counter) => StarsCounter(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(todo),
        ),
        body: SingleChildScrollView(
          child: Consumer<StarsCounter>(
            builder: (context, counter, _) {
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                       counter.setStars(counter.count + 1);
                    },
                    child: Hero(
                      tag: "me",
                      child: Image.asset('assets/images/me.jpg'),
                    ),
                  ),
                  stars,
                  Text(
                    "Trying being open-minded:",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  chartWidget
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
  void toggleFavorite(int favoriteCount) {}
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  // ···
  int _favoriteCount = 0;

  void toggleFavorite(int favoriteCount) {
    setState(() {
      _favoriteCount = favoriteCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<StarsCounter>(context, listen: true);
    _favoriteCount = counter.count;
    print('_favoriteCount ${_favoriteCount}');

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_favoriteCount >= 1
                ? Icon(Icons.star)
                : Icon(Icons.star_border)),
            color: Colors.red[500],
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_favoriteCount > 1
                ? Icon(Icons.star)
                : Icon(Icons.star_border)),
            color: Colors.red[500],
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_favoriteCount > 2
                ? Icon(Icons.star)
                : Icon(Icons.star_border)),
            color: Colors.red[500],
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_favoriteCount > 3
                ? Icon(Icons.star)
                : Icon(Icons.star_border)),
            color: Colors.red[500],
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_favoriteCount > 4
                ? Icon(Icons.star)
                : Icon(Icons.star_border)),
            color: Colors.red[500],
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
