import 'package:flutter/material.dart';
import 'package:minal_chat_app/pages/login_page.dart';
import 'package:minal_chat_app/pages/sign_up.dart';

class AuthenticationLendingPage extends StatefulWidget {
  const AuthenticationLendingPage({super.key});

  @override
  State<AuthenticationLendingPage> createState() =>
      _AuthenticationLendingPageState();
}

class _AuthenticationLendingPageState extends State<AuthenticationLendingPage> {
  bool showLoginPage = true;
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return SignUpPage(onTap: togglePages);
    }
  }
}
