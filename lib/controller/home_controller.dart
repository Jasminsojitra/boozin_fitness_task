import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health/health.dart';

import '../services/health_services.dart';
import '../utils/strings.dart';

class HomeController extends GetxController {
  var healthDataPoint = <HealthDataPoint>[].obs;
  var error = "".obs;

  @override
  void onInit() {
    super.onInit();
    googleSign();
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/fitness.activity.read',
    ],
  );
  googleSign() async {
    if (await _googleSignIn.isSignedIn()) {
      fetchHealthData();
    } else {
      _googleSignIn.signIn().then((data) {
        print(data);
        if (data != null) {
          fetchHealthData();
        } else {
          Get.snackbar(AppText.error, AppText.errorSignIn);
        }
      });
    }
  }

  void fetchHealthData() async {
    try {
      final healthData = await HelthService().fetchHealthData();
      healthDataPoint.assignAll(healthData);
      error.value = "";
    } catch (e) {
      error.value = e.toString();
    }
    update();
  }
}
