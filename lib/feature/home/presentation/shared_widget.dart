import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold_pricing/core/constant/color_manager.dart';
import 'package:gold_pricing/core/constant/font_manager.dart';
import 'package:gold_pricing/core/constant/string_manager.dart';
import 'package:gold_pricing/core/widgets/custom_button.dart';

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
    );
  }
}

class Header extends StatelessWidget {
  final bool isGold;
  final String text;
  const Header({super.key, required this.isGold, required this.text});

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
