import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold_pricing/feature/home/data/models/item_model.dart';
import 'package:gold_pricing/feature/home/presentation/logic/cubit.dart';
import 'package:gold_pricing/feature/home/presentation/logic/states.dart';
import 'package:gold_pricing/feature/home/presentation/shared_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getAllData(),
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
                      CustomAppBar(
                        onPressed: () {
                          AppCubit.get(context).getAllData();
                        },
                      ),
                      SizedBox(height: 20.h),
                      BlocBuilder<AppCubit, AppStates>(
                        buildWhen: (previous, current) {
                          return current is GetGoldPriceSuccess ||
                              current is GetGoldPriceLoadingState ||
                              current is GetGoldPriceError ||
                              current is GetAllDataSuccess ||
                              current is GetDataLoadingState;
                        },
                        builder: (context, state) {
                          MetalModel? gold;
                          if (state is GetAllDataSuccess) {
                            gold = state.gold;
                          } else if (state is GetGoldPriceSuccess) {
                            gold = state.gold;
                          }

                          if (gold != null) {
                            return Header(
                              isGold: true,
                              text: gold.price.toStringAsFixed(2),
                              onPressed: () {
                                AppCubit.get(context).getGoldPrice();
                              },
                            );
                          } else if (state is GetGoldPriceError) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Error: Maybe no internet connection \n \nError Syntax:${state.error}',
                                ),
                              ),
                            );
                          } else {
                            return const HeaderShimmerSkeleton(isGold: true);
                          }
                        },
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height / 5),

                      BlocBuilder<AppCubit, AppStates>(
                        buildWhen: (previous, current) {
                          return current is GetSilverPriceSuccess ||
                              current is GetSilverPriceLoadingState ||
                              current is GetSilverPriceError ||
                              current is GetAllDataSuccess ||
                              current is GetDataLoadingState;
                        },
                        builder: (context, state) {
                          MetalModel? silver;
                          if (state is GetAllDataSuccess) {
                            silver = state.silver;
                          } else if (state is GetSilverPriceSuccess) {
                            silver = state.silver;
                          }

                          if (silver != null) {
                            return Header(
                              isGold: false,
                              text: silver.price.toStringAsFixed(2),
                              onPressed: () {
                                AppCubit.get(context).getSilverPrice();
                              },
                            );
                          } else if (state is GetSilverPriceError) {
                            return Text('Error: ${state.error}');
                          }
                          if (state is GetDataLoadingState ||
                              state is GetSilverPriceLoadingState) {
                            return const HeaderShimmerSkeleton(isGold: false);
                          }
                          return const SizedBox();
                        },
                      ),
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
