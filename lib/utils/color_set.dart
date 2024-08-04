import 'package:flutter/material.dart';

Color greenColor = Color(0xFFAAC9BF);
Color blueLightolor = Color(0xFFD8EBFD);
Color redLightolor = Color(0xFFFFE0DD);
Color yellowLightolor = Color(0xFFFFF3D9);
Color greyLightolor = Color(0xFFD1D1D1);
 String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }