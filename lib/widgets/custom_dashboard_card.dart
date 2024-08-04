import 'package:classroom_project/utils/color_set.dart';
import 'package:classroom_project/utils/custom_image_view.dart';
import 'package:classroom_project/utils/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDashboardCard extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final Color? colorIcon;
  final String? image;
  final String? title;
  const CustomDashboardCard({
    super.key,
    this.color,
    this.image,
    this.title,
    this.colorIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 23.h,
          width: 42.w,
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: image,
                height: 3.h,
                width: 10.w,
                color: colorIcon,
              ),
              SizedBox(height: 2.h),
              Text(
                title ?? "",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
