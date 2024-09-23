import 'package:boozin_fitness_task/Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool display = false;
  bool alignLogo = false;

  @override
  void initState() {
    super.initState();
    _startAnimationLogo();
  }

  Future<void> _startAnimationLogo() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() => alignLogo = !alignLogo);
    await Future.delayed(const Duration(milliseconds: 100));
    animationComplete();
  }

  Future<void> animationComplete() async {
    setState(() => display = true);
    await Future.delayed(const Duration(seconds: 2));
    Get.Off(() => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 220,
              height: 90,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 500),
                    alignment: alignLogo ? const Alignment(0.580, 0) : Alignment.center,
                    child: Image.asset(
                      "assets/icons/i.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (alignLogo)
                    AnimatedOpacity(
                      opacity: display ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 1500),
                      child: Image.asset(
                        Get.isDarkMode ? "assets/icons/dark/splash_boozn.png" : "assets/icons/light/splash_boozn.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            // animate the fitness text on the screen
            AnimatedOpacity(
              opacity: display ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1500),
              child: Text(
                AppText.fitness,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: GoogleFonts.nunito().fontFamily,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
