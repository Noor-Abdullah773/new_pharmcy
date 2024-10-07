import 'package:flutter/material.dart';

import '../../../helper/storage_helper.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  @override
  StorageHelper storageHelper = StorageHelper.instance;
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 54, 152, 131),
      //backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(storageHelper.readKey("name")),
            accountEmail: Text(storageHelper.readKey("email")),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            decoration: const BoxDecoration(
                
                ),
          ),
          ListTile(
            title: Text(
              'أدويتي',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(Icons.medical_information, color: Colors.white),
            onTap: () {
              Navigator.pushNamed(context, '/mydrug');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'تبرع',
              style: TextStyle(color: Colors.white),
            ),
            leading:
                Icon(Icons.currency_exchange_outlined, color: Colors.white),
            onTap: () {
              Navigator.pushNamed(context, '/addDrug');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'تبرعاتي',
              style: TextStyle(color: Colors.white),
            ),
            leading:
                Icon(Icons.currency_exchange_outlined, color: Colors.white),
            onTap: () {
              Navigator.pushNamed(context, '/mydonait');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'ملفي',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(Icons.file_open, color: Colors.white),
            onTap: () {
              Navigator.pushNamed(context, '/mydonait');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'تسجيل خروج',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(Icons.settings, color: Colors.white),
            onTap: () {
              storageHelper.removeAll();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/splash', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
