import 'package:flutter/material.dart';
import 'package:todo_ap/screen/screen_3.dart';


class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          "Screen 2",
          style: TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Screen3()),
          );
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}