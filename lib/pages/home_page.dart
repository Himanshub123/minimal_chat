import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:minal_chat_app/custom_widget/custom_drawer.dart';
import 'package:minal_chat_app/custom_widget/custom_userTile.dart';
import 'package:minal_chat_app/services/auth_service.dart';

import '../services/chat_service.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static const platform = MethodChannel('com.example.minal_chat_app/battery');
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  final RxString batteryLevel = 'Unknown battery level.'.obs;

  Future<void> getBatteryLevel() async {
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      print("battery level ${result.toString()}");
      batteryLevel.value = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel.value = "Failed to get battery level: '${e.message}'.";
    }
  }

  init() {
    getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const CustomDrawer(),
      body: Column(children: [
        Obx(() {
          getBatteryLevel();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              batteryLevel.toString(),
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          );
        }),
        _buildUserList()
      ]),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }

          return ListView(
              children: snapshot.data!
                  .map<Widget>(
                      (userData) => _buildUserListItem(userData, context))
                  .toList());
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData['email'] != _authService.getCurrentUser()!.email.toString()) {
      return CustomUserTile(
        title: userData['email'],
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatPage(email: userData['email'])));
        },
      );
    } else {
      return Container();
    }
  }
}
