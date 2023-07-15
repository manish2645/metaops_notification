import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}
class NotificationItem {
  final String imageUrl;
  final String title;
  final String description;
  final String time;
  final String pageName;

  NotificationItem({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.time,
    required this.pageName,
  });
}

class _NotificationPageState extends State<NotificationPage> {

  final List<NotificationItem> notifications = [
    NotificationItem(
      imageUrl:
      'https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png',
      title: 'Isha Roy',
      description: 'Requested to join ',
      time: '2 days ago',
      pageName: 'Panchyat community',
    ),
    NotificationItem(
      imageUrl:
      'https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png',
      title: 'Dyuti Mohapatra',
      description: 'Made you moderator in ',
      time: '2 days ago',
      pageName: 'Democracies faces',
    ),
    NotificationItem(
        imageUrl:
        'https://img.icons8.com/?size=1x&id=106PofAoe3p7&format=png',
        title: 'Hitesh Rana',
        description: 'Requested to join ',
        time: '2 days ago',
        pageName: 'Panchyat community'
    ),
    NotificationItem(
        imageUrl:
        'https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png',
        title: 'Isha Roy',
        description: 'Requested to join ',
        time: '2 days ago',
        pageName: 'Panchyat community'
    ),
  ];

  late List<bool> isReadList;
  @override
  void initState() {
    super.initState();
    isReadList = List<bool>.filled(notifications.length, false); // Initialize isReadList in initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Image.asset(
            'assets/comunity_notification_images/comunity_notification.png',
            height: 30,
            width: 30,
          ),
        ),
        title: const Text(
          "Notification",
          style: TextStyle(
            color: Color.fromARGB(255, 40, 40, 40),
            fontWeight: FontWeight.normal,
            fontFamily: 'Lato-Black',
            fontSize: 24,
          ),
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  isReadList[index] = !isReadList[index]; // Toggle the read/unread state
                });
              },
              child: Container(
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isReadList[index]
                      ? Colors.transparent
                      : Color.fromARGB(255, 244, 244, 255),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: CachedNetworkImageProvider(
                            notifications[index].imageUrl,
                          ),
                          radius: 30,
                        ),
                        title: Text(
                          notifications[index].title,
                          style: const TextStyle(
                            fontFamily: 'Roboto-Regular',
                            fontSize: 16,
                            color: Color.fromARGB(255, 40, 40, 40),
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              notifications[index].description,
                              style: const TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontSize: 12,
                                color: Color.fromARGB(255, 173, 173, 173),
                              ),
                            ),
                            Text(
                              notifications[index].pageName,
                              style: const TextStyle(
                                fontFamily: 'Roboto-Medium',
                                fontSize: 12,
                                color: Color.fromARGB(255, 43, 47, 111),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        notifications[index].time,
                        style: const TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontSize: 12,
                          color: Color.fromARGB(255, 173, 173, 173),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

