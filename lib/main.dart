import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minal_chat_app/firebase_options.dart';
import 'package:minal_chat_app/services/auth_gate.dart';
import 'package:minal_chat_app/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MinimalChatApp());
}

class MinimalChatApp extends StatelessWidget {
  const MinimalChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
    );
  }
}
