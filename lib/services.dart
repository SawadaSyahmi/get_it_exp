// services/counter_service.dart
import 'package:flutter/material.dart';

class CounterService extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class MessageService extends ChangeNotifier {
  String _message = "Hello, GetIt!";

  String get message => _message;

  void updateMessage(String newMessage) {
    _message = newMessage;
    notifyListeners();
  }
}
