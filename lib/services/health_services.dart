import 'package:get/get.dart';
import 'package:health/health.dart';

import '../utils/strings.dart';

class HelthService {
  HealthFactory healths = HealthFactory();

  Future<List<HealthDataPoint>> fetchHealthData() async {
    final types = [
      HealthDataType.STEPS,
      HealthDataType.ACTIVE_ENERGY_BURNED,
    ];

    final permissions = [
      HealthDataAccess.READ,
      HealthDataAccess.READ,
    ];

    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    List<HealthDataPoint> healthData = [];

    bool requested = await healths.requestAuthorization(types, permissions: permissions);

    if (requested) {
      healthData = await healths.getHealthDataFromTypes(yesterday, now, types);
    } else {
      Get.snackbar(AppText.error, AppText.errorPermission);
    }
    return healthData;
  }
}
