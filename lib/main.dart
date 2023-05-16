import 'package:flutter/material.dart';
import 'package:travelblog/Screen/blogdisplay.dart';
import 'package:travelblog/Screen/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travelblog/components/uploadBlogs.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UploadBlogs(),
    );
  }
}
