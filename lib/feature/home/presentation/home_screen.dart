import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold_pricing/feature/home/presentation/logic/cubit.dart';
import 'package:gold_pricing/feature/home/presentation/logic/states.dart';
import 'package:gold_pricing/feature/home/presentation/shared_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getGoldPrice(),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFFF9E7), Color(0xFFFEFDF9), Colors.white],
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
                      BlocBuilder<AppCubit, AppStates>(
                        builder: (context, state) {
                          if (state is GetGoldPriceSuccess) {
                            return Header(
                              isGold: true,
                              text: state.gold.price.toStringAsFixed(2),
                            );
                          } else if (state is GetGoldPriceError) {
                            return Text('Error: ${state.error}');
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height / 5),
                      const Header(isGold: false, text: '1250.5'),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
