import 'package:flutter/material.dart';
import 'package:portfolio/port_folio_page.dart';
import 'package:portfolio/screen_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const PortfolioScreen(),
    );
  }
}
