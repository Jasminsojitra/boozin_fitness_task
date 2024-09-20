import 'package:boozin_fitness_task/screen/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/Home_controller.dart';
import '../utils/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              final _healthDataPoint = controller.healthDataPoint;
              int steps;
              int calories;
              if (_healthDataPoint.isNotEmpty) {
                steps = _healthDataPoint.first.value as int;
                calories = _healthDataPoint.last.value as int;
              } else {
                steps = 0;
                calories = 0;
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppText.hi,
                    style: GoogleFonts.nunito(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 40),
                  HomeCard(
                    imagePath: Get.isDarkMode ? "assets/icons/dark/footsteps.png" : "assets/icons/light/footsteps.png",
                    heading: AppText.steps,
                    value: steps.toDouble(),
                    title: '$steps',
                    goal: '15,000',
                  ),
                  const SizedBox(height: 20),
                  HomeCard(
                    imagePath: Get.isDarkMode ? "assets/icons/dark/kcal.png" : "assets/icons/light/kcal.png",
                    heading: AppText.caloriesBurned,
                    value: calories.toDouble(),
                    title: '$calories',
                    goal: '15,000',
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
