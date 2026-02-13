import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold_pricing/core/constant/color_manager.dart';
import 'package:gold_pricing/core/constant/font_manager.dart';
import 'package:gold_pricing/core/constant/string_manager.dart';
import 'package:gold_pricing/core/widgets/custom_button.dart';
import 'package:shimmer/shimmer.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? onPressed;
  const CustomAppBar({super.key, this.onPressed});

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
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
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
          Spacer(),
          IconButton(icon: Icon(Icons.refresh_sharp), onPressed: onPressed),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final bool isGold;
  final String text;
  final VoidCallback onPressed;
  const Header({
    super.key,
    required this.isGold,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 15.w),
            Container(
              width: 4,
              height: 30,
              decoration: BoxDecoration(
                color: isGold
                    ? ColorManager.goldBadge
                    : ColorManager.silverBadge,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              isGold ? StringManager.goldPrices : StringManager.silverPrices,
              style: TextStyle(
                fontSize: FontSize.s20,
                fontWeight: FontWeightManager.medium,
                color: ColorManager.primaryTextColor,
              ),
            ),
            Spacer(),
            CustomButton(
              color: isGold ? ColorManager.goldBadge : ColorManager.silverBadge,
              onPressed: onPressed,
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isGold
                  ? ColorManager.goldGradient
                  : ColorManager.silverGradient,
            ),
            border: Border.all(
              color: isGold
                  ? ColorManager.goldBorder
                  : ColorManager.silverBorder,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: FontSize.s28,
                      fontWeight: FontWeightManager.bold,
                      color: ColorManager.primaryTextColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    StringManager.usd,
                    style: TextStyle(
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.bold,
                      color: isGold
                          ? ColorManager.goldBadge
                          : ColorManager.silverBadge,
                    ),
                  ),
                ],
              ),
              Text(
                StringManager.perOnce,
                style: TextStyle(
                  color: ColorManager.secondaryTextColor,
                  fontSize: FontSize.s12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HeaderShimmerSkeleton extends StatelessWidget {
  final bool isGold;
  const HeaderShimmerSkeleton({super.key, required this.isGold});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: isGold
          ? ColorManager.goldBorder.withOpacity(0.5)
          : ColorManager.silverBorder,
      highlightColor: isGold
          ? ColorManager.goldGradient[0]
          : ColorManager.silverGradient[0],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 15.w),
              Container(
                width: 4,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 100.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Container(
                  width: 60.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            height: 105.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 1),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: 70.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
