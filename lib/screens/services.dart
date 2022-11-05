import 'package:flutter/material.dart';
import 'package:libraryapp/screens/main_screen.dart';

class ServicesScreen extends StatefulWidget {
  final String name;
  const ServicesScreen({
    super.key,
    required this.name,
  });

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  List<String> items = [
    'طباعة مناهج',
    'تصوير',
    'تغليف',
    'بحث',
    'تسجيل وظائف',
    'تسجيل طلاب',
    'تسجيل مواد للطلاب',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const Text(
                'اختر الخدمة',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1)),
                padding: const EdgeInsets.all(15),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration.collapsed(
                    hintText: 'اختر الخدمة',
                  ),
                  items: items
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() {}),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'عدد النسخ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: 'عدد النسخ',
                  contentPadding: const EdgeInsets.only(
                      left: 15, bottom: 11, top: 11, right: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'الملاحظات',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: 'الملاحظات',
                  contentPadding: const EdgeInsets.only(
                      left: 15, bottom: 11, top: 11, right: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'رفع الملفات',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'رفع الملف',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text('اعتماد الطلب'),
                            content:
                                const Text('نشكرك على استخدام تطبيق نسختي،'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainScreen()),
                                    );
                                  },
                                  child: const Text('حسنا'))
                            ],
                          ));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: const Text(
                  'اعتماد الطلب',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      )),
    );
  }
}
