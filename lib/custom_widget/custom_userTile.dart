import 'package:flutter/material.dart';

class CustomUserTile extends StatelessWidget {
  const CustomUserTile({super.key, required this.title, required this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          const Icon(Icons.person),
          const SizedBox(width: 25),
          Text(title)
        ]),
      ),
    );
  }
}
