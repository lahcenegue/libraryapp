import 'package:flutter/material.dart';
import 'package:libraryapp/data/services_list.dart';
import 'package:libraryapp/screens/order.dart';

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
  ServicesList servicesList = ServicesList();
  List<int> _selectedItems = <int>[];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            Flexible(
              child: ListView.separated(
                itemCount: servicesList.servicesList.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
                itemBuilder: (context, index) {
                  return Container(
                    color: (_selectedItems.contains(index))
                        ? Colors.blue.withOpacity(0.5)
                        : Colors.transparent,
                    child: ListTile(
                      onTap: () {
                        if (_selectedItems.contains(index)) {
                          setState(() {
                            _selectedItems.removeWhere((val) => val == index);
                          });
                        }
                      },
                      onLongPress: () {
                        if (!_selectedItems.contains(index)) {
                          setState(() {
                            _selectedItems.add(index);
                          });
                        }
                      },
                      title: Text(
                        servicesList.servicesList[index]['title'],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const OrderScreen()),
                );
              },
              child: const Text('اكمال الطلب'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      )),
    );
  }
}
