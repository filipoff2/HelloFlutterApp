import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
      ClicksPerYear('Desctop', 60, Colors.blue),
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
            "Trying being open-minded:",
            style: TextStyle(fontSize: 20.0),
          ),
          chartWidget
        ],
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
