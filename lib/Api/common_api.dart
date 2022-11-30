import 'dart:convert';

import 'package:http/http.dart' as http;

ApiServices apiServices = ApiServices();

class ApiServices {
  Future<bool> uploadImage({required String imageUrl}) async {
    const url = "https://snoo.gl/api/v2/method/account.insertimages";

    final response =
        await http.post(Uri.parse(url), body: {'images': imageUrl});

    if (response.statusCode == 200) {
      try {
        final jsonResponse = jsonDecode(response.body);
        print(jsonResponse['error']);
        if (!jsonResponse['error']) {
          return true;
        }
        return false;
      } catch (e) {
        return false;
      }
    } else {
      return false;
    }
  }
}
