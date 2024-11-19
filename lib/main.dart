import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'storage/shared_preference_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceStorage.init();
  runApp(const CVApp());
}

class CVApp extends StatelessWidget {
  const CVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.light(),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
