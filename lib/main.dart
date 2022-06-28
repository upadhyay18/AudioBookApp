import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bookapp/pages/home/home.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Sangrah",
    home: Home(),
  ));
}
