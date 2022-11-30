import 'dart:convert';
import 'package:assessmentapp/Models/gif_api_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GifApiProvider with ChangeNotifier {
  bool _error = false;
  String _errorMessage = "";
  GifApiResponseModel? _gifApiResponseModel;

  Future<void> fetchData({required int limit}) async {
    final url =
        "https://api.tenor.com/v1/search?key=X2918E9QRHPH&amp;q=trending&amp;limit=" +
            limit.toString();

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      try {
        final jsonResponse = jsonDecode(response.body);
        _gifApiResponseModel = GifApiResponseModel.fromJson(jsonResponse);
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _gifApiResponseModel = null;
      }
    } else {
      _error = true;
      _errorMessage =
          "Error with response code " + response.statusCode.toString();
      _gifApiResponseModel = null;
    }
    notifyListeners();
  }

  bool get error => _error;

  String get errorMessage => _errorMessage;

  GifApiResponseModel? get gifApiResponseModel => _gifApiResponseModel;

  bool get isLoading => _error == false && _gifApiResponseModel == null;

  initialize() {
    _gifApiResponseModel = null;
    _error = false;
    _errorMessage = "";
  }
}
