import 'package:flutter/material.dart';

class ScreenUtil {
  static late double width;
  static late double height;
  static late double screenWidth;
  static late double screenHeight;

  // Initialize with the context to get screen dimensions
  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    // Set the base dimensions for scaling (you can adjust this for different screen sizes)
    width = screenWidth;
    height = screenHeight;
  }

  // Method to get scaled width based on screen size
  static double setWidth(double width) {
    return width * screenWidth / 375; // 375 is the base screen width, adjust as needed
  }

  // Method to get scaled height based on screen size
  static double setHeight(double height) {
    return height * screenHeight / 812; // 812 is the base screen height, adjust as needed
  }

  // Method to get scaled font size based on screen size
  static double setFontSize(double fontSize) {
    return fontSize * screenWidth / 375; // Same base as setWidth, adjust as needed
  }
}
