import 'package:chat_app/screens/chat.dart';
import 'package:chat_app/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      home:
          //adding this cauise if the token is valid then after restarting app it will be starts wherever screen it stopped
          StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }
          if (snapshot.hasData) {
            return const ChatScreen();
          }

          return const AuthScreen();
        }),
      ),
    );
  }
}
