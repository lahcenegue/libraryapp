import 'package:flutter/material.dart';
import 'package:libraryapp/screens/login_persson.dart';
import 'login_library.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
              child: Scaffold(
            appBar: AppBar(
              title: const Text('تسجيل الدخول'),
              centerTitle: true,
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: 'دخول مشتري',
                  ),
                  Tab(
                    text: 'دخول مكتبة',
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                LoginPersson(),
                LoginLibrary(),
              ],
            ),
          ))),
    );
  }
}
