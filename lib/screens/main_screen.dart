import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text('قائمة المكتبات'),
        ),
        body: ListView(
          children: [],
        ),
      )),
    );
  }
}
