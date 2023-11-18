import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class RemoteServices extends GetxController {
  static var client = http.Client();

  @override
  void onInit() {
    super.onInit();
  }

  static Future<String?> postQrcode(String str_qroce) async {

    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://vast-rose-vulture-wrap.cyclic.app/qrcode'));
    request.body = json.encode({
      "qrcode": "$str_qroce"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var datas = await response.stream.bytesToString();
      log(datas.toString());
      return datas;
    }
    else {
      return null;
      print(response.reasonPhrase);
    }
  }
}
