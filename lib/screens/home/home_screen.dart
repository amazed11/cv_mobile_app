import 'package:cv_mobile_app/screens/api/api_sample_screen.dart';
import 'package:cv_mobile_app/screens/grid/grid_screen.dart';
import 'package:cv_mobile_app/screens/login/login_screen.dart';
import 'package:cv_mobile_app/screens/registration_form/register_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegisterScreen()));
          },
          child: const Text("Registration Form"),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GridScreen(),
              ),
            );
          },
          child: const Text("Grid"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ApiSampleScren(),
              ),
            );
          },
          child: const Text("Api Sample"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          child: const Text("Login screen"),
        ),
      ],
    );
  }
}
