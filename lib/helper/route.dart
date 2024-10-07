import 'package:flutter/material.dart';
import 'package:pharmcy/core/models/catgury.dart';
import 'package:pharmcy/core/views/screens/cart_screen.dart';
import 'package:pharmcy/core/views/screens/donait/donation_form.dart';
import 'package:pharmcy/core/views/screens/donait/donation_list.dart';
import 'package:pharmcy/core/views/screens/donait/donits.dart';
import 'package:pharmcy/core/views/screens/drug_list.dart';
import 'package:pharmcy/core/views/screens/home.dart';
import 'package:pharmcy/core/views/screens/authorization/login.dart';
import 'package:pharmcy/core/views/screens/donait/my_donit.dart';
import 'package:pharmcy/core/views/screens/my_drug.dart';
import 'package:pharmcy/core/views/screens/profile.dart';
import 'package:pharmcy/core/views/screens/authorization/regester.dart';
import 'package:pharmcy/core/views/screens/authorization/singup.dart';
import 'package:pharmcy/core/views/screens/authorization/splash_screen.dart';
import 'package:pharmcy/core/views/screens/showCategory.dart';
import 'package:pharmcy/core/views/screens/tap_drug.dart';

import '../core/views/screens/test_categury.dart';

class RouteManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (ctx) => Home());
      case '/splash':
        return MaterialPageRoute(builder: (ctx) => SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (ctx) => LoginScreen());

      case '/regester':
        return MaterialPageRoute(builder: (ctx) => RegesterScreen());
      case '/singup':
        return MaterialPageRoute(builder: (ctx) => SingUpScreen());

      case '/donait':
        return MaterialPageRoute(builder: (ctx) => Donits());
      case '/mydonait':
        return MaterialPageRoute(builder: (ctx) => MyDonit());
      case '/mydrug':
        return MaterialPageRoute(builder: (ctx) => MyDrug());
      case '/addDrug':
        return MaterialPageRoute(builder: (ctx) => AddDrug());

      case '/drugList':
        return MaterialPageRoute(builder: (ctx) => DrugList());

      case '/cart':
        return MaterialPageRoute(builder: (ctx) => CartScreen());

      case '/profile':
        return MaterialPageRoute(builder: (ctx) => Profile());

      case '/donstionlist':
        return MaterialPageRoute(builder: (ctx) => DonationListScreen());

      case '/donationForm':
        return MaterialPageRoute(builder: (ctx) => DonationForm());
      case '/catgury_test':
        return MaterialPageRoute(builder: (ctx) => CateguryView());
      case '/showCategory':{
        Categury categury =settings.arguments as Categury;
         return MaterialPageRoute(builder: (ctx) => ShowCategory(c:categury),settings:settings);
      }
       
    }
  }
}
