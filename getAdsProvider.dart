import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GetAdsProvider {
  Future<Map<String, dynamic>> getAds(String link) async {
    final http.Response response = await http.get(
        Uri.parse('https://timosh.com.ua/assets/$link'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': qwerty
        });

    return compute(parseAds, response.body);
  }
}

Map<String, dynamic> parseAds(String responseBody) {
  Map<String, dynamic> responseJson =
      jsonDecode(responseBody).cast<String, dynamic>();

  return responseJson;
}
