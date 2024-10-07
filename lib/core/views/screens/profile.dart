import 'package:flutter/material.dart';
import 'package:pharmcy/core/views/widgets/stack_widget.dart';
import 'package:pharmcy/core/views/widgets/text_form.dart';

class Profile extends StatelessWidget {
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StackWidgt(
      hight: 550,
      my_widget: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
         
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 72, 165, 141),
                  borderRadius: BorderRadius.circular(100)),
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'صانع/ة التغيير',
                strutStyle: StrutStyle(fontFamily: 'myfont'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Bio here sothimg like personal info '),
            ),
            const SizedBox(height: 16),
            AppTextForm(
              controller: cityController,
              obscure: false,
              hint: 'enter your city',
            ),
            const SizedBox(height: 8),
            AppTextForm(
              icon: Icon(Icons.phone),
              controller: phoneController,
              obscure: false,
              hint: 'enter your phone number',
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Edit Profile'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Logout'),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
