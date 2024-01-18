import 'dart:math';

import 'package:flutter/material.dart';

import '../pages/setting_page.dart';
import '../services/auth_service.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  void logOut() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            //Header
            DrawerHeader(
                child: Center(
              child: Icon(
                Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
            )),
            //Home list tile
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                title: const Text(
                  'H O M E',
                ),
                leading: const Icon(Icons.home),
              ),
            ),
            //Setting tile
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingPage()));
                },
                title: const Text(
                  'S E T T I N G S',
                ),
                leading: const Icon(Icons.settings),
              ),
            )
          ],
        ),

        Padding(
          padding: const EdgeInsets.all(16),
          child: ListTile(
            onTap: () {
              logOut();
            },
            title: const Text(
              'L O G  O U T',
              style: TextStyle(wordSpacing: 1.0),
            ),
            leading: const Icon(Icons.logout),
          ),
        )

        //Logout
      ]),
    );
  }
}
