import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold_pricing/core/di/service_locator.dart';
import 'package:gold_pricing/core/routing/app_router.dart';
import 'package:gold_pricing/core/routing/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  dioSetupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Gold Pricing',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        initialRoute: Routes.home,
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
