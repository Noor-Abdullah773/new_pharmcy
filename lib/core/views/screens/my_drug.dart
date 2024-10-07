import 'package:flutter/material.dart';

class MyDrug extends StatelessWidget {
  const MyDrug({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 239, 237, 237),
        appBar: AppBar(
          backgroundColor: const Color(0xff08685a),
          centerTitle: true,
          title: const Text(
            'أدويتي',
            style: TextStyle(color: Colors.white, fontFamily: 'myfont'),
          ),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 30),
                    //child: Image.asset('assets/icons/pharmacy(1).png'),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Row(
                      children: [
                        const Text(
                          'اسم الدواء : ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('دواء ضغط'),
                      ],
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      children: [
                        const Text(
                          'الكمية : ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          '6',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
