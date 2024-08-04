import 'package:classroom_project/utils/color_set.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DetailCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final int? count;
  final String? countTitle;
  final bool? student;
   DetailCard({
    super.key, this.title, this.subtitle, this.count, this.countTitle,  this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: greyLightolor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Expanded(
            child: ListTile(
              title: Text(
     title ?? "",
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
    ),
              subtitle:Text(
      subtitle ?? "",
      style: TextStyle( fontSize: 9.sp),
    ),
     ),
          ),
          student == true ?
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Age : $count",
                  style: TextStyle( fontSize: 10.sp),
                   ),
              ),
            ],
          ) :
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text("$count" ,
                  style: TextStyle( fontSize: 12.sp),
                ),
                ),
                Text(countTitle ?? "",
                style: TextStyle( fontSize: 10.sp),
                 ),
              ],
            ),
          )
         
        ],
      ),
    ),
              );
  }
}