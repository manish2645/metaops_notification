import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/ConvertPage.dart';
import 'screens/MemberScreenPage.dart';
import 'screens/ScanPage.dart';
import 'screens/comunity_notification_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MetaOps',
      initialRoute: '/',
      routes: {
        '/': (context) => const MemberScan(),
        '/scan':(context) => const ScanPage(),
        '/convert':(context) => const ConvertPageScreen(),
        //'/import': (context) => ImportPage(),
        //'/' : (context) => const PopUpScreen(),
        '/notification':(context) => NotificationPage(),
      },
    );
  }
}

