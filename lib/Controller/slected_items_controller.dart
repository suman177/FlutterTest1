import 'package:flutter/material.dart';

class SelectedGifProvider with ChangeNotifier {
  final List<String> _selectedUrls = [];

  void addImageUrl(String value) {
    _selectedUrls.add(value);
    _selectToUpload.add(false);
    notifyListeners();
  }

  String getAtIndex(
    int index,
  ) {
    return _selectedUrls[index];
  }

  List<String> get selectedUrls => _selectedUrls;

  int getLength() {
    return _selectedUrls.length;
  }

  final List<bool> _selectToUpload = [];

  List<bool> get getSelectToUploadList => _selectToUpload;

  selectUpload(int index, bool value) {
    _selectToUpload[index] = value;
    notifyListeners();
  }

  bool selectToUpload(int index) => _selectToUpload[index];
}
