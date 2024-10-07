import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pharmcy/core/veiwModel/donationvm.dart';
import 'package:pharmcy/core/veiwModel/usrtVm.dart';
//import 'package:pharmcy/generated/l10n.dart';
import 'package:pharmcy/helper/route.dart';
import 'package:provider/provider.dart';

import 'core/veiwModel/categury_vm.dart';

void main() {
  runApp(const MyApp());
}

/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserVm>(create: (ctx) => UserVm()),
        ChangeNotifierProvider<DonationVM>(create: (ctx) => DonationVM()),
      ],
      child: const MaterialApp(
       /* localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ar', ''),
        ],*/
        debugShowCheckedModeBanner: false,
        initialRoute: '/catgury_test',
        onGenerateRoute: RouteManager.generateRoute,
      ),
    );
  }
}*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserVm>(create: (ctx) => UserVm()),
        ChangeNotifierProvider<DonationVM>(create: (ctx) => DonationVM()),
        ChangeNotifierProvider<CateguryVM>(create: (ctx) => CateguryVM()),
      ],
      child: MaterialApp(
       /* locale: Locale('ar'),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,*/
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        onGenerateRoute: RouteManager.generateRoute,
      ),
    );
  }
}

