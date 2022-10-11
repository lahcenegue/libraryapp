import 'package:flutter/material.dart';
import 'package:libraryapp/data/librory_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LibraryList libraryList = LibraryList();
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text('قائمة المكتبات'),
        ),
        body: ListView.separated(
          itemCount: libraryList.libraryList.length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 20);
          },
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {},
                child: Text(
                  libraryList.libraryList[index]['name'],
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
