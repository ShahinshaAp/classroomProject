import 'dart:developer';

import 'package:classroom_project/provider_state/classroom_provider.dart';
import 'package:classroom_project/screens/classroom_detail.dart';
import 'package:classroom_project/services/global_error_handling.dart';
import 'package:classroom_project/utils/color_set.dart';
import 'package:classroom_project/utils/custom_image_view.dart';
import 'package:classroom_project/utils/image_constant.dart';
import 'package:classroom_project/widgets/custom_elavated_button.dart';
import 'package:classroom_project/widgets/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  void initState() {
    super.initState();
    // Fetch classrooms data when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Your logic here
    });
  }

  @override
  Widget build(BuildContext context) {
    final classroomProvider = Provider.of<ClassroomProvider>(context);

    return Scaffold(
      
      floatingActionButton:  CustomElevatedButton(
                          onPressed: () {
                            GlobalErrorHandler.showError("I am facing an issue with an API and need to fix it."); 
                          },
                          text: "New Registration",
                          height: 4.h,
                          width: 40.w,
                          borderRadius: 9,
                          buttonStyle: ButtonStyle(
                            textStyle: WidgetStateProperty.all(
                              const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(blueLightolor),
                            foregroundColor:
                                WidgetStateProperty.all(Colors.blue),
                          ),
                        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,                  
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
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Registration',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              'No Data',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
          ),
          
        ],
      ),
    );
  }
}

