import 'package:classroom_project/utils/color_set.dart';
import 'package:classroom_project/utils/custom_image_view.dart';
import 'package:classroom_project/utils/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ConferenceTable extends StatelessWidget {
  const ConferenceTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.center,
     children: [
       SizedBox(
         width: 10.h,
         child: Column(
           children: [
              CustomImageView(
     imagePath: ImageConstant.sittingLeft ,                                             
      ),
      SizedBox(height: 1.h,),
        CustomImageView(
     imagePath: ImageConstant.sittingLeft ,                                             
      ),
        SizedBox(height: 1.h,),
        CustomImageView(
     imagePath: ImageConstant.sittingLeft ,                                             
      ),
        SizedBox(height: 1.h,),
        CustomImageView(
     imagePath: ImageConstant.sittingLeft ,                                             
      ),
        SizedBox(height: 1.h,),
        CustomImageView(
     imagePath: ImageConstant.sittingLeft ,                                             
      ),
        SizedBox(height: 1.h,),
        CustomImageView(
     imagePath: ImageConstant.sittingLeft ,                                             
      ),
        SizedBox(height: 1.h,),
        CustomImageView(
     imagePath: ImageConstant.sittingLeft ,                                             
      ),
        SizedBox(height: 1.h,),
        CustomImageView(
     imagePath: ImageConstant.sittingLeft ,                                             
      ),
      
           ],
         ),
       ),
       Container(
         height: 30.h ,
         width: 15.h,
         decoration: BoxDecoration(
           color: greyLightolor
         ),
        
       ),
        SizedBox(
         width: 10.h,
         child: Column(
           children: [
              CustomImageView(
     imagePath: ImageConstant.sittingright ,                                             
      ),
      SizedBox(height: 1.h,),
        CustomImageView(
     imagePath: ImageConstant.sittingright ,                                             
      ),
        SizedBox(height: 1.h,),
        CustomImageView(
     imagePath: ImageConstant.sittingright ,                                             
      ),
        SizedBox(height: 1.h,),
        CustomImageView(
     imagePath: ImageConstant.sittingright ,                                             
      ),
        SizedBox(height: 1.h,),
        CustomImageView(
     imagePath: ImageConstant.sittingright ,                                             
      ),
        SizedBox(height: 1.h,),
        CustomImageView(
     imagePath: ImageConstant.sittingright ,                                             
      ),
        SizedBox(height: 1.h,),
        CustomImageView(
     imagePath: ImageConstant.sittingright ,                                             
      ),
        SizedBox(height: 1.h,),
        CustomImageView(
     imagePath: ImageConstant.sittingright ,                                             
      ),
      
           ],
         ),
       ),
     
     ],
    );
  }
}