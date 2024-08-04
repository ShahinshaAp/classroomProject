import 'package:classroom_project/screens/classroom_list.dart';
import 'package:classroom_project/screens/registration.dart';
import 'package:classroom_project/screens/student_list.dart';
import 'package:classroom_project/screens/subject_list.dart';
import 'package:classroom_project/utils/color_set.dart';
import 'package:classroom_project/utils/custom_image_view.dart';
import 'package:classroom_project/utils/image_constant.dart';
import 'package:classroom_project/widgets/custom_dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text('Hello', style: TextStyle(fontWeight: FontWeight.bold),),
            Text(
              getGreeting(),
              style: TextStyle(fontSize: 14.sp),
            ),
          ],
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
     
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CustomDashboardCard(
                      onTap: () {
                         Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StudentListScreen(),
                      ),
                    );
                      },
                       color: greenColor,
                      title: "Student",
                      colorIcon: Colors.green,
                      image: ImageConstant.studentCap,
                    ),
                     CustomDashboardCard(
                       onTap: () {
                         Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SubjectListScreen(),
                      ),
                    );
                      },
                          color: blueLightolor,
                      title: "Subject",
                      colorIcon: Colors.blue,
                      image: ImageConstant.bookCap,
                     ),
                  ],
                ),
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CustomDashboardCard(
                       onTap: () {
                         Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ClassRoomListScreen(),
                      ),
                    );
                      },
                      color: redLightolor,
                      title: "Class Rooms",
                      colorIcon: Colors.red,
                      image: ImageConstant.classCap,
                    ),
                     CustomDashboardCard(
                       onTap: () {
                         Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Registration(),
                      ),
                    );
                      },
                       color: yellowLightolor,
                      title: "Registration",
                      colorIcon: Colors.yellow,
                      image: ImageConstant.registrationCap,
                     ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

