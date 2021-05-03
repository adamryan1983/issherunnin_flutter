import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:issherunnin_flutter/tabs.dart';
import '../subpages/flanders.dart';
import '../subpages/legionnaire.dart';

class BoatController extends GetxController {
  final selected = 'Please select a status'.obs;
  void setSelected(String value) {
    selected.value = value;
  }

  // set ferryStatus(FerryModel value) => this._ferryModel.value = value;

  // void clear() {
  //   _ferryModel.value = FerryModel();
  // }

  @override
  void onInit() {}

  setLegionnaireStatus(String status, String reason, String note) async {
    if (status == 'Please select a status') {
      status = 'delayed';
    }

    CollectionReference reference =
        FirebaseFirestore.instance.collection("legionnaire");
    Map<String, dynamic> legionnaire = {
      "datetime": DateTime.now(),
      "status": status,
      "reason": reason,
      "note": note,
    };
    await reference
        .add(legionnaire)
        .then((value) => Get.offAll(Legionnaire()).catchError(
              (onError) => Get.snackbar(
                  "Error while updating Ferry Status ", onError.message,
                  snackPosition: SnackPosition.BOTTOM),
            ));
    await Get.offAll(Legionnaire());
  }

  setFlandersStatus(String status, String reason, String note) async {
    if (status == 'Please select a status') {
      status = 'delayed';
    }

    CollectionReference reference =
        FirebaseFirestore.instance.collection("flanders");
    Map<String, dynamic> flanders = {
      "datetime": DateTime.now(),
      "status": status,
      "reason": reason,
      "note": note,
    };
    await reference
        .add(flanders)
        .then((value) => Get.offAll(Flanders()).catchError(
              (onError) => Get.snackbar(
                  "Error while updating Ferry Status ", onError.message,
                  snackPosition: SnackPosition.BOTTOM),
            ));
  }
}
