import 'package:flutter/material.dart';
import '../home_page.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          "Screen 3",
          style: TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
            (route) => false,
          );
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
