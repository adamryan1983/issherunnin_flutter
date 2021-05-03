import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../subpages/lineup.dart';

class LineupController extends GetxController {
  final selectedSide = 'Please select a side'.obs;
  void setSelectedSide(String value) {
    selectedSide.value = value;
  }

  void onInit() {}

  void setLineupStatus(String cars, String side, String location) async {
    if (side == 'Please select a side') {
      side = 'Bell Island';
    }
    CollectionReference reference =
        FirebaseFirestore.instance.collection("lineup");
    Map<String, dynamic> userdata = {
      "datetime": DateTime.now(),
      "cars": cars,
      "side": side,
      "geolocation": location,
    };
    await reference
        .add(userdata)
        .then((value) => Get.offAll(LineupPage()).catchError(
              (onError) => Get.snackbar(
                  "Error while updating Lineup Status ", onError.message,
                  snackPosition: SnackPosition.BOTTOM),
            ));
  }
}
