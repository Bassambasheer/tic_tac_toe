import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/core/widgets/text_widget.dart';
import 'package:tic_tac_toe/theme/theme.dart';
import 'package:tic_tac_toe/view/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: AnimatedSplashScreen(
          backgroundColor: black,
          splash: const TextWidget(
              text: "Nymble", size: 35, color: white, weight: FontWeight.bold),
          nextScreen: const HomeScreen()),
    );
  }
}
