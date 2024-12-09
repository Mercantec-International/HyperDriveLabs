import 'package:rc_controller/classes/api/objects/car.dart';
import '../../helper/GeneralHelper.dart';
import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '/main.dart';

class CheckCarResponse {
  List<CarObject> Cars = [];

  CheckCarResponse(Response response) {
    try {
      final data = jsonDecode(response.body);
      if (data.runtimeType == List<dynamic>) {
        for (var item in data) {
          Cars.add(CarObject(item["id"], item["userId"], DateTime.parse(item["createdAt"]), DateTime.parse(item["updatedAt"]), DateTime.parse(item["lastEmergency"])));
        }
      }
    } catch (_) {
      General.makeSnackBar("Could not read response from api");
    }
  }
}