import 'package:cv_mobile_app/screens/login/login_screen.dart';
import 'package:cv_mobile_app/screens/main_screen.dart';
import 'package:cv_mobile_app/storage/shared_preference_storage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (checkLoggedIn()) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainScreen()));
      }
    });
  }

  bool checkLoggedIn() {
    return SharedPreferenceStorage.getToken == null;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.yellow,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Our CV App",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ));
  }
}
