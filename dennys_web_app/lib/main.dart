import 'package:flutter/material.dart';
import 'data_service.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  final DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Firestore Save Data')),
        body: Center(
          child: ElevatedButton(
            onPressed: dataService.saveToFirestore,
            child: Text('Save Data to Firestore'),
          ),
        ),
      ),
    );
  }
}
