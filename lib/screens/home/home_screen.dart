import 'package:cv_mobile_app/screens/animation/animation_screen.dart';
import 'package:cv_mobile_app/screens/api/api_sample_screen.dart';
import 'package:cv_mobile_app/screens/course/course_design_screen.dart';
import 'package:cv_mobile_app/screens/grid/grid_screen.dart';
import 'package:cv_mobile_app/screens/login/login_screen.dart';
import 'package:cv_mobile_app/screens/registration_form/register_screen.dart';
import 'package:cv_mobile_app/screens/state_management/state_mgmt_screen.dart';
import 'package:cv_mobile_app/screens/tabbar/tabbar_screen.dart';
import 'package:cv_mobile_app/screens/tap/tap_screen.dart';
import 'package:flutter/material.dart';

import '../page_builder/page_builder_screen.dart';

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
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StateMgmtScreen(),
              ),
            );
          },
          child: const Text("State Management with GetX"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TapScreen(),
              ),
            );
          },
          child: const Text("Tap Screen"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TabbarScreen(),
              ),
            );
          },
          child: const Text("Tabbar"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AnimationScreen(),
              ),
            );
          },
          child: const Text("Animation"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PageBuilderScreen(),
              ),
            );
          },
          child: const Text("Pagebuilder"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CourseDesignScreen(),
              ),
            );
          },
          child: const Text("Course Design"),
        ),
      ],
    );
  }
}
