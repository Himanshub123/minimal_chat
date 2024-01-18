import 'package:flutter/material.dart';
import 'package:minal_chat_app/custom_widget/custom_button.dart';
import 'package:minal_chat_app/custom_widget/custom_textfield.dart';
import 'package:minal_chat_app/services/auth_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.onTap});
  //Email and pass text controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final void Function()? onTap;

  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInEmailPassword(
          _emailController.text, _passController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            //welcome back message
            Text(
              "Welcome back. you've been missed!",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),

            const SizedBox(
              height: 50,
            ),

            //email textfeild
            CustomTextField(
                hintText: "Email",
                obscureText: false,
                controller: _emailController),
            const SizedBox(
              height: 8,
            ),
            //Password textfield
            CustomTextField(
                hintText: "Password",
                obscureText: true,
                controller: _passController),
            //login button
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              title: "Login",
              onTap: () {
                login(context);
              },
            ),
            const SizedBox(
              height: 25,
            ),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member? ',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Register now',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
