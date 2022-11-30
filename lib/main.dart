import 'package:assessmentapp/Api/gif_api_provider.dart';
import 'package:assessmentapp/Api/uploded_moments_provider.dart';
import 'package:assessmentapp/Controller/page_controller.dart';
import 'package:assessmentapp/Pages/uploadedMoments/uploaded_moments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Controller/slected_items_controller.dart';
import 'Pages/home/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GifApiProvider>(
            create: (context) => GifApiProvider()),
        ChangeNotifierProvider<SelectedGifProvider>(
            create: (context) => SelectedGifProvider()),
        ChangeNotifierProvider<HomePageController>(
            create: (context) => HomePageController()),
        ChangeNotifierProvider<UploadedMomentsProvider>(
            create: (context) => UploadedMomentsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Assessment',
        routes: {
          '/uploadedMoments': (context) => const UploadedMoments(),
        },
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const HomePage(),
      ),
    );
  }
}
