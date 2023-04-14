import 'package:flutter/material.dart';

import 'basic/basic.dart';
//import 'store_app/store_app.dart';
//import 'music_app/music_app.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      title: 'WeSlide Demo',
      debugShowCheckedModeBanner: false,
      // home: MusicApp(),
      //home: StoreApp(),
      home: const Basic(),
    );
  }
}
