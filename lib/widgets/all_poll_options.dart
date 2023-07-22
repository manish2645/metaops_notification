import 'package:flutter/material.dart';
import 'comunity_edit_poll_widget.dart';

class AllPollOptions extends StatefulWidget {
  const AllPollOptions({super.key});

  @override
  State<AllPollOptions> createState() => _AllPollOptionsState();
}

class _AllPollOptionsState extends State<AllPollOptions> {
  List<bool> checkedList = [false, false];
  @override
  Widget build(BuildContext context) {
    return IconButton(
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
                                actionsPadding: const EdgeInsets.all(20),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                ),
                                content: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    height: MediaQuery.of(context).size.height * 0.30,
                                    width: MediaQuery.of(context).size.width*0.90,
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
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                                      color: Color.fromARGB(255, 224, 255, 225),
                                                      boxShadow: checkedList[0]
                                                          ? [
                                                        BoxShadow(
                                                          color: Color(0xff2D2F74).withOpacity(0.2),
                                                          spreadRadius: 2,
                                                          blurRadius: 8,
                                                          offset: Offset(0, 4),
                                                        ),
                                                      ]
                                                          : [],
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment.center,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Image.asset(
                                                                'assets/comunity_notification_images/community_notify_whatsapp_icon.png',
                                                                height: 60,
                                                                width: 60,
                                                              ),
                                                              SizedBox(height: 20,),
                                                              Text(
                                                                "Whatsapp",
                                                                style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 12,
                                                                  fontFamily: 'Roboto-Medium',
                                                                  color: Color.fromARGB(255, 51, 53, 125),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top:  -8,
                                                          right: -8,
                                                          child: Checkbox(
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(5),
                                                              side: const BorderSide(
                                                                color: Color.fromARGB(255, 237, 238, 255),
                                                              ),
                                                            ),
                                                            activeColor: Color(0xff33357D),
                                                            checkColor: Colors.white,
                                                            value: checkedList[0],
                                                            onChanged: (newValue) {
                                                              setState(() {
                                                                checkedList[0] = !checkedList[0];
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 20),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                                      color: Color.fromARGB(255, 255, 246, 221),
                                                      boxShadow: checkedList[1]
                                                          ? [
                                                        BoxShadow(
                                                          color: Color(0xff2D2F74).withOpacity(0.2),
                                                          spreadRadius: 2,
                                                          blurRadius: 8,
                                                          offset: Offset(0, 4),
                                                        ),
                                                      ]
                                                          : [],
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment.center,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Image.asset(
                                                                'assets/comunity_notification_images/community_notify_email_icon.png',
                                                                height: 60,
                                                                width: 60,
                                                              ),
                                                              SizedBox(height: 20,),
                                                              Text(
                                                                "Email",
                                                                style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 12,
                                                                  fontFamily: 'Roboto-Medium',
                                                                  color: Color.fromARGB(255, 51, 53, 125),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: -8,
                                                          right: -8,
                                                          child: Checkbox(
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(5),
                                                              side: const BorderSide(
                                                                color: Color.fromARGB(255, 237, 238, 255),
                                                              ),
                                                            ),
                                                            activeColor: Color(0xff33357D),
                                                            checkColor: Colors.white,
                                                            value: checkedList[1],
                                                            onChanged: (newValue) {
                                                              setState(() {
                                                                checkedList[1] = !checkedList[1];
                                                              });
                                                            },
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
                                      height: MediaQuery.of(context).size.height * 0.10,
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
                                Navigator.pushNamed(context, '/poll_insight');
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
                                      height: MediaQuery.of(context).size.height * 0.10,
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
    );
  }
}
