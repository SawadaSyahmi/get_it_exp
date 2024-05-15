import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_exp/services.dart';


// Create a GetIt instance
final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<CounterService>(() => CounterService());
  getIt.registerLazySingleton<MessageService>(() => MessageService());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetIt Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CounterSection(),
            SizedBox(height: 20),
            MessageSection(),
          ],
        ),
      ),
    );
  }
}

class CounterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterService = getIt<CounterService>();

    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: counterService,
          builder: (context, _) {
            return Text(
              'Counter: ${counterService.count}',
              style: TextStyle(fontSize: 24),
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            counterService.increment();
          },
          child: Text('Increment Counter'),
        ),
      ],
    );
  }
}

class MessageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final messageService = getIt<MessageService>();

    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: messageService,
          builder: (context, _) {
            return Text(
              messageService.message,
              style: TextStyle(fontSize: 24),
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            messageService.updateMessage("New Message from GetIt!");
          },
          child: Text('Update Message'),
        ),
      ],
    );
  }
}
