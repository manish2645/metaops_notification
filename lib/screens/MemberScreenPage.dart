import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:metaops/comminuty_notification%20services.dart';
import '../widgets/comunity_edit_poll_widget.dart';
import 'community_onboard_import_page.dart';

class MemberScan extends StatefulWidget {
  const MemberScan({super.key});
  @override
  State<MemberScan> createState() => _MemberScanState();
}

String url = "https://network-45465464.min.co/share-community";

class _MemberScanState extends State<MemberScan> {

  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit();
    //notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value){
      print('device token');
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                //click function here
              },
              child: const Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 40, 40, 40)),
            ),
            const Text("Onboard Member",
              style: TextStyle(
                color: Color.fromARGB(255, 40, 40, 40),
                fontWeight: FontWeight.normal,
                fontFamily: 'Lato-Black',
                fontSize: 18,
              ),),
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/notification');
                },
                icon: Stack(
                  children: [
                    Icon(Icons.notifications, color: Colors.black),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '2', // Replace with the actual count of unread notifications
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.black,),
                onPressed: () {
                  showModalBottomSheet(
                    elevation: 1,
                    showDragHandle: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          double screenWidth = MediaQuery.of(context).size.width;
                                          double screenHeight = MediaQuery.of(context).size.height;
                                          return AlertDialog(
                                            insetPadding: const EdgeInsets.all(10),
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                                            actionsPadding: const EdgeInsets.all(15.0),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15.0),
                                              ),
                                            ),
                                            content: SingleChildScrollView(
                                              child: Container(
                                                constraints: BoxConstraints(maxHeight: screenHeight * 0.30),
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                width: screenWidth * 0.90, // Adjust the width as needed
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Edit Poll",
                                                          style: TextStyle(
                                                            fontFamily: 'Roboto-Medium',
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        IconButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          icon: Image.asset(
                                                            'assets/commnunity_edit_poll_images/comunity_notify_cross_icon.png',
                                                            height: 15,
                                                            width: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: CustomDialog(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    width: screenWidth * 0.25, // Adjust the width as needed
                                                    height: 35,
                                                    child: ElevatedButton(
                                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(20.0),
                                                        ),
                                                      ),
                                                      child: const Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(255, 40, 40, 40),
                                                          fontFamily: 'Lato-Regular',
                                                          fontWeight: FontWeight.normal,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  SizedBox(
                                                    width: screenWidth * 0.25, // Adjust the width as needed
                                                    height: 35,
                                                    child: ElevatedButton(
                                                      onPressed: () => Navigator.pop(context, 'Save'),
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: const Color.fromARGB(255, 51, 53, 125),
                                                        foregroundColor: Colors.white,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(20.0),
                                                        ),
                                                      ),
                                                      child: const Text(
                                                        'Save',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(255, 255, 255, 255),
                                                          fontFamily: 'Lato-Regular',
                                                          fontWeight: FontWeight.normal,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/commnunity_edit_poll_images/community_editpoll_edit_icon.png',
                                          width: 60,
                                          height: 60,
                                        ),
                                        const Text(
                                          "Edit",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 40, 40, 40),
                                            fontSize: 16,
                                            fontFamily: 'Roboto-Medium',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),


                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          insetPadding: const EdgeInsets.all(15),
                                          contentPadding: const EdgeInsets.all(5),
                                          actionsPadding: const EdgeInsets.only(bottom: 15, right: 15),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15.0),
                                            ),
                                          ),
                                          content: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                              height: screenHeight*0.30,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("Notify Members",
                                                        style: TextStyle(
                                                            fontFamily: 'Roboto-Medium',
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      IconButton(
                                                          onPressed: (){
                                                            Navigator.pop(context);
                                                          },
                                                          icon: Image.asset(
                                                            'assets/commnunity_edit_poll_images/comunity_notify_cross_icon.png',
                                                            height: 20,
                                                            width: 20,
                                                          )
                                                      )
                                                    ],
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          height: 152,
                                                          width: 149,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                                              color: Color.fromARGB(255,224,255,225)
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              Icon(Icons.whatshot,color: Colors.green,),
                                                              Text("Whatsapp",
                                                                style: TextStyle(
                                                                  fontWeight: FontWeight.normal,
                                                                  fontSize: 12,
                                                                  fontFamily: 'Roboto-Medium',
                                                                  color: Color.fromARGB(255,51,53,125),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(width: 10,),
                                                        Container(
                                                          height: 152,
                                                          width: 149,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                                              color: Color.fromARGB(255,255,246,221)
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              Icon(Icons.email,color: Colors.yellow,),
                                                              Text("Email",
                                                                style: TextStyle(
                                                                  fontWeight: FontWeight.normal,
                                                                  fontSize: 12,
                                                                  fontFamily: 'Roboto-Medium',
                                                                  color: Color.fromARGB(255,51,53,125),

                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                          ),
                                          actions: <Widget>[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  height: 30,
                                                  child: ElevatedButton(
                                                    onPressed: () => Navigator.pop(context, 'Cancel'),
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: const Color.fromARGB(255,241,241,241),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(20.0),
                                                        )
                                                    ),
                                                    child: const Text('Cancel',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(255, 40, 40, 40),
                                                          fontFamily: 'Lato-Regular',
                                                          fontWeight: FontWeight.normal,
                                                          fontSize: 14
                                                      ),),
                                                  ),
                                                ),
                                                const SizedBox(width: 5,),
                                                SizedBox(
                                                  width: 100,
                                                  height: 30,
                                                  child: ElevatedButton(
                                                    onPressed: () => Navigator.pop(context, 'Notify'),
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: const Color.fromARGB(255,51,53,125),
                                                        foregroundColor: Colors.white,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(20.0),
                                                        )
                                                    ),
                                                    child: const Text('Notify',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(255, 255, 255, 255),
                                                          fontFamily: 'Lato-Regular',
                                                          fontWeight: FontWeight.normal,
                                                          fontSize: 14
                                                      ),),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/commnunity_edit_poll_images/community_editpoll_notify_icon.png',
                                          width: 60, // Adjust the width as per your requirements
                                          height: 60, // Adjust the height as per your requirements
                                        ),
                                        const Text(
                                          "Notify",
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 40, 40, 40),
                                              fontSize: 16,
                                              fontFamily: 'Roboto-Medium',
                                              fontWeight: FontWeight.bold
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap:(){

                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/commnunity_edit_poll_images/community_editpoll_share_icon.png',
                                          width: 60, // Adjust the width as per your requirements
                                          height: 60, // Adjust the height as per your requirements
                                        ),
                                        const Text(
                                          "Share",
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 40, 40, 40),
                                              fontSize: 16,
                                              fontFamily: 'Roboto-Medium',
                                              fontWeight: FontWeight.bold
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 238, 241, 250),
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) => AlertDialog(
                                              insetPadding: const EdgeInsets.all(15),
                                              contentPadding: const EdgeInsets.all(15),
                                              actionsPadding: const EdgeInsets.only(bottom: 20, right: 20),
                                              shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(12.0),
                                                ),
                                              ),
                                              content: Container(
                                                padding: EdgeInsets.zero,
                                                height: screenHeight * 0.10,
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Image.asset('assets/community_popup_images/community_popup_stop_poll_icon.png',
                                                      height: 40,
                                                      width: 40,
                                                    ),
                                                    const SizedBox(width: 15,),
                                                    const Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text('Stop Poll ?',
                                                            style: TextStyle(
                                                                color: Color.fromARGB(255, 40, 40, 40),
                                                                fontFamily: 'Roboto-Medium',
                                                                fontWeight: FontWeight.normal,
                                                                fontSize: 20
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                          Expanded(
                                                            child: Text('Are you sure want stop the poll? No more data will be collected after stopping the poll.',
                                                              style: TextStyle(
                                                                  color: Color.fromARGB(255, 110, 110, 110),
                                                                  fontFamily: 'Roboto-Black',
                                                                  fontWeight: FontWeight.normal,
                                                                  fontSize: 14
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      width: 100,
                                                      height: 30,
                                                      child: ElevatedButton(
                                                        onPressed: () => Navigator.pop(context, 'Cancel'),
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor: const Color.fromARGB(255,241,241,241),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(20.0),
                                                            )
                                                        ),
                                                        child: const Text('Cancel',
                                                          style: TextStyle(
                                                              color: Color.fromARGB(255, 40, 40, 40),
                                                              fontFamily: 'Lato-Regular',
                                                              fontWeight: FontWeight.normal,
                                                              fontSize: 14
                                                          ),),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5,),
                                                    SizedBox(
                                                      width: 100,
                                                      height: 30,
                                                      child: ElevatedButton(
                                                        onPressed: () => Navigator.pop(context, 'Yes'),
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor: const Color.fromARGB(255,51,53,125),
                                                            foregroundColor: Colors.white,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(20.0),
                                                            )
                                                        ),
                                                        child: const Text('Yes',
                                                          style: TextStyle(
                                                              color: Color.fromARGB(255, 255, 255, 255),
                                                              fontFamily: 'Lato-Regular',
                                                              fontWeight: FontWeight.normal,
                                                              fontSize: 14
                                                          ),),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/commnunity_edit_poll_images/community_editpoll_stop_icon.png',
                                              width: 50, // Adjust the width as per your requirements
                                              height: 50, // Adjust the height as per your requirements
                                            ),
                                            const SizedBox(width: 10),
                                            const Text(
                                              "Stop Poll",
                                              style: TextStyle(
                                                  color: Color.fromARGB(255, 40, 40, 40),
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto-Medium',
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap:(){

                                        },
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/commnunity_edit_poll_images/community_editpoll_insight_icon.png',
                                              width: 50, // Adjust the width as per your requirements
                                              height: 50, // Adjust the height as per your requirements
                                            ),
                                            const SizedBox(width: 10),
                                            const Text(
                                              "Poll Insights",
                                              style: TextStyle(
                                                  color: Color.fromARGB(255, 40, 40, 40),
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto-Medium',
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap:(){

                                        },
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/commnunity_edit_poll_images/community_editpoll_duplicate_icon.png',
                                              width: 50, // Adjust the width as per your requirements
                                              height: 50, // Adjust the height as per your requirements
                                            ),
                                            const SizedBox(width: 10),
                                            const Text(
                                              "Duplicate",
                                              style: TextStyle(
                                                  color: Color.fromARGB(255, 40, 40, 40),
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto-Medium',
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) => AlertDialog(
                                              insetPadding: const EdgeInsets.all(15),
                                              contentPadding: const EdgeInsets.all(15),
                                              actionsPadding: const EdgeInsets.only(bottom: 20, right: 20),
                                              shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(12.0),
                                                ),
                                              ),
                                              content: Container(
                                                padding: EdgeInsets.zero,
                                                height: screenHeight * 0.10,
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Image.asset('assets/community_popup_images/community_popup_delete_poll_icon.png',
                                                      height: 40,
                                                      width: 40,
                                                    ),
                                                    const SizedBox(width: 15,),
                                                    const Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text('Delete Poll ?',
                                                            style: TextStyle(
                                                                color: Color.fromARGB(255, 40, 40, 40),
                                                                fontFamily: 'Roboto-Medium',
                                                                fontWeight: FontWeight.normal,
                                                                fontSize: 20
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                          Flexible(
                                                            child: Text('If you delete.This poll will deleted permanently and you will lose all the like, comments and data.',
                                                              style: TextStyle(
                                                                  color: Color.fromARGB(255, 110, 110, 110),
                                                                  fontFamily: 'Roboto-Black',
                                                                  fontWeight: FontWeight.normal,
                                                                  fontSize: 14
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      width: 100,
                                                      height: 30,
                                                      child: ElevatedButton(
                                                        onPressed: () => Navigator.pop(context, 'Cancel'),
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor: const Color.fromARGB(255,241,241,241),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(20.0),
                                                            )
                                                        ),
                                                        child: const Text('Cancel',
                                                          style: TextStyle(
                                                              color: Color.fromARGB(255, 40, 40, 40),
                                                              fontFamily: 'Lato-Regular',
                                                              fontWeight: FontWeight.normal,
                                                              fontSize: 14
                                                          ),),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5,),
                                                    SizedBox(
                                                      width: 100,
                                                      height: 30,
                                                      child: ElevatedButton(
                                                        onPressed: () => Navigator.pop(context, 'Delete'),
                                                        child: const Text('Yes',
                                                          style: TextStyle(
                                                              color: Color.fromARGB(255, 255, 255, 255),
                                                              fontFamily: 'Lato-Regular',
                                                              fontWeight: FontWeight.normal,
                                                              fontSize: 14
                                                          ),),
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor: const Color.fromARGB(255,230,57,70),
                                                            foregroundColor: Colors.white,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(20.0),
                                                            )
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/commnunity_edit_poll_images/community_editpoll_delete_icon.png',
                                              width: 50, // Adjust the width as per your requirements
                                              height: 50, // Adjust the height as per your requirements
                                            ),
                                            const SizedBox(width: 10),
                                            const Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: Color.fromARGB(255, 255, 59, 83),
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto-Medium',
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: CardWithUrl(url: url)
              ),
              Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: const SocialInvitation()
              ),
              Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: const ManualInvitation()
              ),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: const BulkInvitation()
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Copy Widget
class CardWithUrl extends StatelessWidget {
  final String url;

  CardWithUrl({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 8,
            offset: const Offset(0,2),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
        ),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Padding(
          padding: const EdgeInsets.only(left:17),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      url,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(40, 40, 40, 0.63),
                          fontFamily: 'Roboto-Black',
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: url));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Text copied')),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255,51,53,125),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0)
                      )
                  ),
                  child: Row(
                      children: [
                        Image.asset(
                          'assets/onboard_member_copy_icon.png',
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Copy',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Social Widget
class SocialInvitation extends StatelessWidget {
  const SocialInvitation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Social Invitation",
                style: TextStyle(
                  fontFamily: 'Lato-Black',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Divider(
                color: Color.fromRGBO(237, 238, 255, 1),
                thickness: 1,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/onboard_member_contact_icon.png',
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Invite members",
                            style: TextStyle(
                              fontFamily: 'Roboto-Black',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            "Invite Meta Users",
                            style: TextStyle(
                              color: Color.fromARGB(255, 173, 173, 173),
                              fontFamily: 'Roboto-Black',
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle click event here
                    },
                    child: Image.asset(
                      'assets/onboard_member_arrow_icon.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}



// Manual Widget
class ManualInvitation extends StatelessWidget {
  const ManualInvitation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Manual Invitation",
                style: TextStyle(
                  fontFamily: 'Lato-Black',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Divider(
                color: Color.fromRGBO(237, 238, 255, 1),
                thickness: 1,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/onboard_member_singleinvitation_icon.png',
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Single Invitation",
                            style: TextStyle(
                              fontFamily: 'Roboto-Black',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            "Invite by connecting your contact list",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 173, 173, 173),
                              fontFamily: 'Roboto-Black',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle click event here
                    },
                    child: Image.asset(
                      'assets/onboard_member_arrow_icon.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}


// Bulk Widgets

class BulkInvitation extends StatefulWidget {
  const BulkInvitation({super.key});

  @override
  State<BulkInvitation> createState() => _BulkInvitationState();
}

class AnimatedListTickerProvider implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}


class _BulkInvitationState extends State<BulkInvitation> {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: AnimatedListTickerProvider());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 8,
            offset: const Offset(0,2),
          ),
        ],
      ),
      child: SizedBox(
        height: 400,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Bulk Invitation",
                      style: TextStyle(
                          fontFamily: 'Roboto-Black',
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Divider(color: Color.fromRGBO(237,238,255, 1), thickness: 1),
                    Text(
                      "Invite more than one people to this community by scanning their details or uploading through CSV.",
                      style: TextStyle(
                          color: Color.fromARGB(255, 177,179,183),
                          wordSpacing: 2,
                          fontFamily: 'Roboto-Black',
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      indicatorColor: Color.fromARGB(255,51,53,125),
                      tabs: [
                        Tab(
                          child: Text(
                            "Scan",
                            style: TextStyle(
                                fontFamily: 'Roboto-Black',
                                color: Color.fromARGB(255, 51, 53, 125), fontSize: 16),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Import File",
                            style: TextStyle(
                                fontFamily: 'Roboto-Black',
                                color: Color.fromARGB(255, 51, 53, 125), fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 200,
                      child: TabBarView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            verticalDirection: VerticalDirection.down,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 20,),
                                  Image.asset(
                                    'assets/onboard_member_info_icon.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "Scan your list of members and Upload to send invite",
                                    style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Color.fromARGB(255, 177,179,183),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              const Scan(),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            verticalDirection: VerticalDirection.down,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 20),
                                  Image.asset(
                                    'assets/onboard_member_info_icon.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  const SizedBox(width: 9),
                                  const Text(
                                    "Upload list of members details in CSV format to invite.",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Roboto-Regular',
                                      fontWeight: FontWeight.normal,
                                      color: Color.fromARGB(255, 177,179,183),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              const ImportFile(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Scan
class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: const Color.fromARGB(255,247,247,255),
      child: SizedBox(
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: DottedBorder(
            color: const Color.fromARGB(255,181,183,255),
            dashPattern: const [5],
            strokeWidth: 2,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 196,
                    height: 38,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/scan');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255,51,53,125)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/onboard_member_scan_icon.png',
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(width: 10,),
                          const Text('Scan',
                            style: TextStyle(
                                fontFamily: 'Lato-Black',
                                fontSize: 18,
                                fontWeight: FontWeight.normal
                            ),),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  const Text("Scan Your Sheet",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Roboto-Black',
                        color: Color.fromARGB(255, 110, 110, 110),
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ],
              ),

            ),
          ),
        ),

      ),
    );
  }
}


// Import
class ImportFile extends StatefulWidget {
  const ImportFile({super.key});

  @override
  State<ImportFile> createState() => _ImportFileState();
}


Future<List<List<dynamic>>> loadCSV() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null && result.files.isNotEmpty) {
    PlatformFile file = result.files.first;
    final filePath = file.path;

    if (filePath != null && await File(filePath).exists()) {
      if (filePath.endsWith('.csv')) {
        // CSV file handling
        List<int> bytes = await File(filePath).readAsBytes();
        String csvString = utf8.decode(bytes, allowMalformed: true);
        List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvString);
        return csvTable;
      }else{
        throw Exception('Unsupported file format');
      }
    } else {
      throw Exception('File does not exist');
    }
  }
  return [];
}


class _ImportFileState extends State<ImportFile> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: const Color.fromARGB(255, 247, 247, 255),
      child: SizedBox(
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: DottedBorder(
            color: const Color.fromARGB(255, 181, 183, 255),
            dashPattern: const [5],
            strokeWidth: 2,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 196,
                    height: 38,
                    child: ElevatedButton(
                      onPressed: () async {
                        //List<List<dynamic>> csvData = await loadCSV();
                        //print('CSV Data: $csvData');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ImportPage(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255,51,53,125)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/onboard_member_csv_icon.png',
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(width: 10,),
                          const Text('Import File',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Lato-Black',
                                fontWeight: FontWeight.normal
                            ),),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  const Text("Upload Your File Here",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Roboto-Black',
                        color: Color.fromARGB(255, 110, 110, 110),
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ],
              ),

            ),
          ),
        ),

      ),
    );
  }
}

