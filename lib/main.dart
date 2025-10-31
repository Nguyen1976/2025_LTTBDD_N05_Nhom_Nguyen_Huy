import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instargram/bottomnav.dart';
import 'package:google_fonts/google_fonts.dart';

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
        textTheme: GoogleFonts.notoSansTextTheme(),

        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BottomNav(),
    );
  }
}
