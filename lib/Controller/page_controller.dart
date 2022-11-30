import 'package:flutter/material.dart';

import '../Pages/audio/audio.dart';
import '../Pages/gif/gif.dart';
import '../Pages/image/image.dart';
import '../Pages/video/video.dart';

class HomePageController with ChangeNotifier {
  final List<Widget> _body = [
    const ImagePage(),
    const VideoPage(),
    const AudioPage(),
    const GifPage(),
  ];

  int _bodyIndex = 0;

  int get bodyIndex => _bodyIndex;

  List<Widget> get body => _body;

  set bodyIndex(int index) {
    _bodyIndex = index;
    notifyListeners();
  }
}
