import 'package:flutter/foundation.dart';

class StarsCounter with ChangeNotifier {

int _count = 0;
int get count => _count;

void setStars( int start) {
  _count = start;
  notifyListeners();
  print('setStars ${start}');
}
}
