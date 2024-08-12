import 'package:flutter/material.dart';

//imports for the firebase use
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//imported packages
import 'package:chat_app/screens/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //firebase initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ChatApp',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AuthScreen(),
    );
  }
}
