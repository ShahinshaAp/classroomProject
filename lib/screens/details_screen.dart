

import 'package:classroom_project/utils/color_set.dart';
import 'package:classroom_project/utils/custom_image_view.dart';
import 'package:classroom_project/utils/image_constant.dart';
import 'package:classroom_project/widgets/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DetailScreen extends StatelessWidget {
  final String? mainTitle;
  final String? title;
  final String? subtitle;
  final String?  trailing;
   final String?  imagePath;
  const DetailScreen({super.key, this.mainTitle, this.title, this.subtitle, this.trailing, this.imagePath});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              mainTitle ?? "",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
          ),
           SizedBox(height: 20.h,),
          Column(
            children: [
            CustomImageView(
              isCircular: true,
              height: 67.h,
             width: 20.h,
            imagePath: imagePath ,
            ),
             SizedBox(height: 5.h,),
             Text(
              title ?? "",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
            ),
             SizedBox(height: 1.h,),
             Text(
              subtitle ?? "",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
            ),
             SizedBox(height: 1.h,),
             Text(
             trailing ?? "",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13.sp),
            ),
            ]
            ,
          )
          
        ],
      ),
    );
  }
}


