import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gold_pricing/core/presentation/shared_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [CustomAppBar()]));
  }
}
