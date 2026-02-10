import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold_pricing/core/constant/color_manager.dart';
import 'package:gold_pricing/core/constant/font_manager.dart';
import 'package:gold_pricing/core/constant/string_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
      decoration: BoxDecoration(
        color: ColorManager.appBarColor,
        boxShadow: [
          BoxShadow(
            color: ColorManager.customGrey.withOpacity(0.1),
            blurRadius: 4.0,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Text(
            StringManager.appName,
            style: TextStyle(
              fontSize: FontSize.s22,
              fontWeight: FontWeightManager.semiBold,
              color: ColorManager.primaryTextColor,
            ),
          ),
          Text(
            StringManager.appBarSubTitle,
            style: TextStyle(
              fontSize: FontSize.s16,
              fontWeight: FontWeightManager.light,
              color: ColorManager.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
