import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project_using_multiple_platrform/firebase_options.dart';
import 'package:firebase_project_using_multiple_platrform/provider/firebase_provider.dart';
import 'package:firebase_project_using_multiple_platrform/screen/auth/login_screen.dart';
import 'package:firebase_project_using_multiple_platrform/screen/chat_screen/chat_screen.dart';
import 'package:firebase_project_using_multiple_platrform/screen/home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseProvider())
      ],
      child: const MyApp()));
}

var uuid = const Uuid();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}



