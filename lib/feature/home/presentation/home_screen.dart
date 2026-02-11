import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold_pricing/core/constant/color_manager.dart';
import 'package:gold_pricing/feature/home/presentation/shared_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF9E7), // درجة Creamy صفراء فاتحة جداً
              Color(0xFFFEFDF9), // درجة انتقالية (Off-white)
              Colors.white,
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  children: [
                    const CustomAppBar(),
                    SizedBox(height: 20.h),
                    const Header(isGold: true),
                    SizedBox(height: MediaQuery.of(context).size.height / 5),
                    const Header(isGold: false),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
