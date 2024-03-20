import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_email/signinpage.dart';
import 'package:flutter/material.dart';

import 'Loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBuKaNIjFpziOqqbJ6cg-_ELbr-eRd77YU",
        appId: "1:483020086260:web:bc286f5a929fceba8ef7a1",
        messagingSenderId: "483020086260",
        projectId: "hello-a0263",),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const sign()
    );
  }
}

