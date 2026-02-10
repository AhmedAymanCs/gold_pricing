import 'package:flutter/material.dart';
import 'package:gold_pricing/core/constant/color_manager.dart';
import 'package:gold_pricing/core/presentation/shared_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: Column(children: [CustomAppBar()]),
    );
  }
}
