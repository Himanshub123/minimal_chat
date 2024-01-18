import 'package:flutter/material.dart';
import 'package:minal_chat_app/services/auth_service.dart';

import '../custom_widget/custom_button.dart';
import '../custom_widget/custom_textfield.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key, required this.onTap});
  //Email and pass text controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _cnfPassController = TextEditingController();

  final void Function()? onTap;

  void signUp(BuildContext context) {
    final authService = AuthService();
    if (_passController.text == _cnfPassController.text) {
      try {
        authService.signUpEmailPassword(
            _emailController.text, _passController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Password dont't match!"),
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
              "Let's create a account for you",
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
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
                hintText: "Confirm password",
                obscureText: true,
                controller: _cnfPassController),
            //login button
            const SizedBox(
              height: 16,
            ),
            CustomButton(
                title: "Register",
                onTap: () {
                  signUp(context);
                }),
            const SizedBox(
              height: 25,
            ),

            //login now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an Account? ',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Login now',
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
