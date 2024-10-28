import 'package:flutter/material.dart';

import '../about/about_me_screen.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({this.name = "Sorry", this.color = Colors.white, super.key});
  String? name;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      backgroundColor: color,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Welcome $name")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AboutScreen(
                              color: Colors.purple,
                            )));
              },
              child: const Text("Go to about"))
        ],
      ),
    );
  }
}
