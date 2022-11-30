import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controller/page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<HomePageController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: pageController.bodyIndex,
        children: pageController.body,
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  buildBody() {
    final pageController = Provider.of<HomePageController>(context);

    return pageController.body.elementAt(pageController.bodyIndex);
  }

  buildBottomNavigationBar() {
    final pageController = Provider.of<HomePageController>(context);
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: 'IMAGE',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_file),
          label: 'VIDEO',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.audio_file),
          label: 'AUDIO',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.gif),
          label: 'GIF',
        ),
      ],
      currentIndex: pageController.bodyIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.brown[500],
      showUnselectedLabels: true,
      onTap: (index) {
        pageController.bodyIndex = index;
      },
    );
  }
}
