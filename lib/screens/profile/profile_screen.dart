import 'package:cv_mobile_app/screens/login/login_screen.dart';
import 'package:cv_mobile_app/storage/shared_preference_storage.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              SharedPreferenceStorage.removeToken();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: const Text("Logout"))
      ],
    );
  }
}
