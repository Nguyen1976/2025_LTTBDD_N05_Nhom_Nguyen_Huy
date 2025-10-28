import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instargram/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBVa1_wMFnYPX1RnGDdtSnREfTS1hPXFzI",
      authDomain: "mobile-ck-39483.firebaseapp.com",
      projectId: "mobile-ck-39483",
      storageBucket: "mobile-ck-39483.firebasestorage.app",
      messagingSenderId: "1045018946545",
      appId: "1:1045018946545:web:754919960a26968374b250",
      measurementId: "G-ZP4TTE0VFT",
    ),
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
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LogIn(),
    );
  }
}
