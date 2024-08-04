import 'package:classroom_project/provider_state/classroom_provider.dart';
import 'package:classroom_project/screens/classroom_detail.dart';
import 'package:classroom_project/screens/classroom_list.dart';
import 'package:classroom_project/screens/dashboard.dart';
import 'package:classroom_project/screens/details_screen.dart';
import 'package:classroom_project/screens/registration.dart';
import 'package:classroom_project/screens/student_list.dart';
import 'package:classroom_project/services/global_error_handling.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ClassroomProvider()),
      ],
          child: MaterialApp(
            scaffoldMessengerKey: GlobalErrorHandler.scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            title: 'Clasroom Project',
            theme: ThemeData(
           primarySwatch: Colors.blueGrey,
              scaffoldBackgroundColor: Colors.white, 
               appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white, 
                foregroundColor: Colors.black,
                elevation: 0, 
              ),
            ),
            home: const DashboardScreen()),
        );
      }
  
        );
  }
}



