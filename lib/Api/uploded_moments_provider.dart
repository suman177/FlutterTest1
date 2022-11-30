import 'dart:convert';
import 'package:assessmentapp/Models/uploaded_moments_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UploadedMomentsProvider with ChangeNotifier {
  bool _error = false;
  String _errorMessage = "";
  UploadedMomentsResponse? _uploadedMomentsResponse;

  Future<void> fetchData() async {
    const url = "https://snoo.gl/api/v2/method/account.getimages";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      try {
        final jsonResponse = jsonDecode(response.body);
        _uploadedMomentsResponse =
            UploadedMomentsResponse.fromJson(jsonResponse);
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _uploadedMomentsResponse = null;
      }
    } else {
      _error = true;
      _errorMessage =
          "Error with response code " + response.statusCode.toString();
      _uploadedMomentsResponse = null;
    }
    notifyListeners();
  }

  bool get error => _error;

  String get errorMessage => _errorMessage;

  UploadedMomentsResponse? get gifApiResponseModel => _uploadedMomentsResponse;

  bool get isLoading => _error == false && _uploadedMomentsResponse == null;

  initialize() {
    _uploadedMomentsResponse = null;
    _error = false;
    _errorMessage = "";
  }
}
