import 'dart:developer';

import 'package:classroom_project/provider_state/classroom_provider.dart';
import 'package:classroom_project/screens/classroom_detail.dart';
import 'package:classroom_project/utils/custom_image_view.dart';
import 'package:classroom_project/utils/image_constant.dart';
import 'package:classroom_project/widgets/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
class ClassRoomListScreen extends StatefulWidget {
  const ClassRoomListScreen({super.key});

  @override
  _ClassRoomListScreenState createState() => _ClassRoomListScreenState();
}

class _ClassRoomListScreenState extends State<ClassRoomListScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch classrooms data when the widget is initialized
      WidgetsBinding.instance.addPostFrameCallback((_) {
           Provider.of<ClassroomProvider>(context, listen: false).fetchClassrooms();
           
       });
 
  }

  @override
  Widget build(BuildContext context) {
    final classroomProvider = Provider.of<ClassroomProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: CustomImageView(
            imagePath: ImageConstant.back,
            height: 5.h,
            width: 9.w,
            color: Colors.black,
          ),
        ),
      ),
      body: classroomProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Class Rooms',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: classroomProvider.classrooms.length,
                    itemBuilder: (context, index) {
                      final classroom = classroomProvider.classrooms[index];
                       
                      return GestureDetector(
                        onTap: () {
                           Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClasroomDetail(
                          mainTitle: classroom.name,
                          classType: classroom.layout ,
                        )
                      ));
                        },
                        child: DetailCard(
                          title: classroom.name,
                          student: false,
                          subtitle: '${classroom.layout}',
                          count: classroom.size,
                          countTitle: 'Seats',
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
  
}
