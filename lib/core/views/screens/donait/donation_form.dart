import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmcy/core/models/donation.dart';
import 'package:pharmcy/core/veiwModel/donationvm.dart';
import 'package:pharmcy/core/views/widgets/button.dart';
import 'package:pharmcy/core/views/widgets/medica_textform.dart';
import 'package:provider/provider.dart';

import '../../../../helper/storage_helper.dart';

class DonationForm extends StatefulWidget {
  @override
  State<DonationForm> createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  StorageHelper storageHelper = StorageHelper.instance;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController quantityController = TextEditingController();

  final TextEditingController shapeController = TextEditingController();

  final TextEditingController typeController = TextEditingController();

  final TextEditingController expireDateController = TextEditingController();
  File? _image;
  
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String usernum = storageHelper.readKey("id");
    return Scaffold(
      body: Consumer<DonationVM>(
        builder: (context, donationVM, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  MedicaTextform(
                    medeicalController: nameController,
                    text: 'اسم الدواء',
                  ),
                  MedicaTextform(
                    medeicalController: quantityController,
                    text: 'الكمية',
                  ),
                  MedicaTextform(
                    medeicalController: shapeController,
                    text: 'شكل العلاج',
                  ),
                 /* MedicaTextform(
                    medeicalController: typeController,
                    text: 'نوع العلاج',
                  ),*/
                  MedicaTextform(
                      medeicalController: expireDateController,
                      text: 'تاريخ انتهاء الصلاحية'),
                  SizedBox(height: 20),
                    InkWell(
                    child: Container(
                      width: 150,
                      height: 100,
                      color: Colors.grey,
                      child: _image == null
                                  ? Text('No image selected.')
                                  : Image.file(File(_image!.path)),
                    ),
                    onTap:pickImage,
                  ),
                  
                  ButtonRounded(
                    onTap: () async {
                      print(usernum);
                      final donation = Donation(
                        name: nameController.text,
                        quantity:int.parse(quantityController.text) ,
                        shape: shapeController.text,
                        type: "ادوية",
                        expireDate: expireDateController.text,
                        userId: int.parse(usernum),
                      );

                      await donationVM.sendDonation(donation);

                      if (donationVM.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('حدث خطأ: ${donationVM.errorMessage}')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('تم إرسال طلبك بنجاح!')),
                        );

                        nameController.clear();
                        quantityController.clear();
                        shapeController.clear();
                        typeController.clear();
                        expireDateController.clear();
                      }
                    },
                    text: 'إرسال الطلب',
                  ),
                  if (donationVM.isLoading) CircularProgressIndicator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
