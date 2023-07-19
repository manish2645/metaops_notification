import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:metaops/comminuty_notification%20services.dart';
import 'package:metaops/screens/community_invitation_details_page.dart';
import 'package:metaops/screens/community_user_details.dart';
import 'screens/ConvertPage.dart';
import 'screens/MemberScreenPage.dart';
import 'screens/ScanPage.dart';
import 'screens/comunity_notification_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationServices().initLocalNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/user_details':(context) => const UserDetails(),
        '/invitation_detail': (context) => const InvitationDetails()
      },
    );
  }
}

