import 'package:flutter/material.dart';
import 'package:libraryapp/data/sqldb.dart';
import 'package:libraryapp/screens/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  SqlDb sqlDb = SqlDb();

  Future<List<Map>> readData() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM 'library'");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text('قائمة المكتبات'),
        ),
        body: FutureBuilder(
            future: readData(),
            builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  padding: const EdgeInsets.only(
                      top: 50, bottom: 100, left: 10, right: 10),
                  itemCount: snapshot.data!.length,
                  separatorBuilder: ((context, index) {
                    return const SizedBox(height: 30);
                  }),
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ServicesScreen(
                              name: 'مكتبة حي ${snapshot.data![index]['city']}',
                            ),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        child: Text(
                          'مكتبة حي ${snapshot.data![index]['city']}',
                          style: const TextStyle(fontSize: 18),
                        ));
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      )),
    );
  }
}
