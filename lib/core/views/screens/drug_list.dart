import 'package:flutter/material.dart';
import 'package:pharmcy/core/veiwModel/categury_vm.dart';
import 'package:pharmcy/core/views/widgets/button.dart';
import 'package:pharmcy/core/views/widgets/categurey_filter.dart';
import 'package:pharmcy/core/views/widgets/dotted_line.dart';
import 'package:pharmcy/core/views/widgets/image_list.dart';
import 'package:provider/provider.dart';

class DrugList extends StatefulWidget {
  const DrugList({super.key});

  @override
  _DrugListState createState() => _DrugListState();
}

class _DrugListState extends State<DrugList> {
  String? selectedForm;
  int? selectedQuantity;
  final List<String> drugForms = [
    'حبوب',
    'شراب',
    'إبر',
    'أشكال أخرى',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        title: Text('قائمة الأدوية'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            height: 40,
            child: const CateguryFilter(),
          ),
          Expanded(
            child: Consumer<CateguryVM>(
              builder: (context, categuryVM, child) {
                if (categuryVM.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (categuryVM.errorMessage != null) {
                  return Center(child: Text(categuryVM.errorMessage!));
                }

                return ListView.builder(
                  itemCount: categuryVM.allCategury.length,
                  itemBuilder: (ctx, index) {
                    final category = categuryVM.allCategury[index];

                    return Container(
                      height: 280,
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    category.name ?? 'Unnamed',
                                    style: TextStyle(fontFamily: 'myfont'),
                                  ),
                                  Wrap(children: [
                                    Text(
                                      category.type ?? 'Unnamed',
                                      style: TextStyle(fontFamily: 'myfont'),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ]),
                                ],
                              ),
                              SizedBox(width: 10),
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 15, right: 10, left: 18),
                                  padding: EdgeInsets.only(top: 10),
                                  width: 100,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 134, 206, 189),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.medical_services,
                                    color: Colors.white,
                                    size: 50,
                                  ))

                              // ImageListDrug(),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const DottedLine(),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'شكل الدواء',
                                style: TextStyle(fontFamily: 'myfont'),
                              ),
                              DropdownButton<String>(
                                hint: const Text('اختر شكل الدواء'),
                                value: selectedForm,
                                items: drugForms.map((String form) {
                                  return DropdownMenuItem<String>(
                                    value: form,
                                    child: Text(form),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedForm = newValue;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'الكمية',
                                style: TextStyle(fontFamily: 'myfont'),
                              ),
                              DropdownButton<int>(
                                hint: const Text('اختر كمية'),
                                value: selectedQuantity,
                                items: List.generate(10, (index) {
                                  return DropdownMenuItem<int>(
                                    value: index + 1,
                                    child: Text((index + 1).toString()),
                                  );
                                }).toList(),
                                onChanged: (int? newValue) {
                                  setState(() {
                                    selectedQuantity = newValue;
                                  });
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 120),
                            child: ButtonRounded(
                              height: 20,
                              width: 50,
                              text: 'اضافة لسالة',
                              onTap: () {},
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
