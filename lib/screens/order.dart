import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text('اتمام الطلب'),
        ),
        body: ListView(children: [
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('تجهيز الطلب'),
                    content: const Text(
                      'سيتم تجهيز طلبك في الحال، يمكنك التقرب منا لإستلامه في أي وقت',
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('حسنا'),
                      )
                    ],
                  ),
                );
              },
              child: const Text('تجهيز الطلب')),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('تجهيز الطلب'),
                    content: const Text(
                      'سيتم إرسال طلبك إلى العنوان المسجل عندنا',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('حسنا'),
                      )
                    ],
                  ),
                );
              },
              child: const Text('إرسال الطلب')),
        ]),
      )),
    );
  }
}
