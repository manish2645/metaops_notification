import 'dart:convert';
import 'package:flutter/material.dart';

class InvitationDetails extends StatefulWidget {
  const InvitationDetails({super.key});

  @override
  State<InvitationDetails> createState() => _InvitationDetailsState();
}

class _InvitationDetailsState extends State<InvitationDetails> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final String successfulData = '''
    [
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      },
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      },
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      },
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      },
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      },
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      },
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      },
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      },
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      },
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      },
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      }
    ]
  ''';

  final String alreadyMemberData= '''
    [
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      },
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      },
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      }
    ]
  ''';


  final String dummyData= '''
    [
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      },
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      },
      {
        "image": "https://img.icons8.com/?size=1x&id=IlBlSvhW3h6Z&format=png",
        "name": "Ethan Michle",
        "phone": "8407364960"
      }
    ]
  ''';

  bool _isExpandedDummyData = false;
  bool _isExpandedAlreadyMemberData = false;

  @override
  Widget build(BuildContext context) {
    List<dynamic> data = json.decode(successfulData);
    List<dynamic> alreadyMemData = json.decode(alreadyMemberData);
    List<dynamic> dummy = json.decode(dummyData);
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text('Invitation Details',
              style: TextStyle(
                color: Color.fromARGB(255, 40, 40, 40),
                fontWeight: FontWeight.normal,
                fontFamily: 'Lato-Black',
                fontSize: 18,
              ),
            ),
            actions: _currentTabIndex == 1
                ? [
              GestureDetector(
                onTap: () {
                  // Perform the action when the 'Failure' tab is selected
                },
                child: Container(
                  margin: const EdgeInsets.all(15),
                  width: 120,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff33357D)),
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: const Color(0xff33357D),
                  ),
                  child: const Center(
                    child: Text(
                      'Invite Again',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        fontFamily: 'Lato-Black',
                      ),
                    ),
                  ),
                ),
              ),
            ] : null,
            bottom:PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    child: Text(
                      'Successful',
                      style: TextStyle(
                          fontSize: _currentTabIndex == 0 ? 20 : 18,
                          fontFamily: 'Lato-Semibold',
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Failure',
                      style: TextStyle(
                          fontSize: _currentTabIndex == 1 ? 20 : 18,
                          fontFamily: 'Lato-Semibold',
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
                labelStyle: TextStyle(
                  fontSize: 24,
                ),
                labelColor: Color(0xff33357D),
                indicatorColor: Color(0xff33357D),
                unselectedLabelColor: Color(0xff282828),
              ),
            ),

          ),
          body: TabBarView(
            controller: _tabController,
            children: [
            SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                verticalDirection: VerticalDirection.down,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Successful Invitation Sent ",
                              style: TextStyle(
                                fontFamily: 'Lato-Bold',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255,40,40,40),
                              ),
                            ),
                            Text(
                              '(${data.length})',
                              style: const TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 110,110,110),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "The invitation has been successfully sent to these users. They will be notified via SMS and email.",
                          style: TextStyle(
                            fontFamily: 'Roboto-Regular',
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255,177,179,183),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 237, 238, 255)
                            )
                        ),
                        shadowColor: const Color.fromRGBO(45, 47, 116, 0.4),
                        elevation: 8,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "List of user",
                                style: TextStyle(
                                  fontFamily: 'Lato-Bold',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 40,40,40),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    leading:CircleAvatar(
                                      backgroundColor: const Color.fromARGB(255,110,110,110),
                                      child: Image.network(data[index]['image']),
                                    ),
                                    title: Text(data[index]['name'],
                                      style: const TextStyle(
                                        fontFamily: 'Roboto-Regular',
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 40, 40, 40),
                                      ),
                                    ),
                                    subtitle: Text(data[index]['phone'],
                                      style: const TextStyle(
                                        fontFamily: 'Roboto-Regular',
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 40, 40, 40),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                verticalDirection: VerticalDirection.down,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Invitation Failure ",
                              style: TextStyle(
                                fontFamily: 'Lato-Bold',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255,40,40,40),
                              ),
                            ),
                            Text(
                              "(${alreadyMemData.length + dummy.length})",
                              style: const TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 110,110,110),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Due to an error, the invitation was not sent to the listed users. Kindly select the desired invitees and click the invite button to resend.",
                          style: TextStyle(
                            fontFamily: 'Roboto-Regular',
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255,177,179,183),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 237, 238, 255)
                            )
                        ),
                        shadowColor: const Color.fromRGBO(45, 47, 116, 0.4),
                        elevation: 8,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Already members ",
                                        style: TextStyle(
                                          fontFamily: 'Lato-Bold',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 40,40,40),
                                        ),
                                      ),
                                      Text(
                                        "(${alreadyMemData.length})",
                                        style: TextStyle(
                                          fontFamily: 'Roboto-Regular',
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromARGB(255, 40,40,40),
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: (){
                                        setState(() {
                                          _isExpandedAlreadyMemberData = !_isExpandedAlreadyMemberData;
                                        });
                                      },
                                      icon: Icon(
                                        _isExpandedAlreadyMemberData ? Icons.expand_less : Icons.expand_more,
                                        color: Colors.grey,
                                        size: 40,
                                      ),
                                  )
                                ],
                              ),
                              AnimatedCrossFade(
                                duration: const Duration(milliseconds: 300),
                                crossFadeState: _isExpandedAlreadyMemberData
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                firstChild: AlreadyMemberList(alreadyMemData: alreadyMemData),
                                secondChild: SizedBox.shrink(),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 237, 238, 255)
                            )
                        ),
                        shadowColor: const Color.fromRGBO(45, 47, 116, 0.4),
                        elevation: 8,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Dummy Error 2 ",
                                        style: TextStyle(
                                          fontFamily: 'Lato-Bold',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 40,40,40),
                                        ),
                                      ),
                                      Text(
                                        "(${dummy.length})",
                                        style: TextStyle(
                                          fontFamily: 'Roboto-Regular',
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromARGB(255, 40,40,40),
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: (){
                                      setState(() {
                                        _isExpandedDummyData = !_isExpandedDummyData;
                                      });
                                    },
                                    icon: Icon(
                                      _isExpandedDummyData ? Icons.expand_less : Icons.expand_more,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  )
                                ],
                              ),
                              AnimatedCrossFade(
                                duration: const Duration(milliseconds: 300),
                                crossFadeState: _isExpandedDummyData
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                firstChild: DummyErrorList(dummyData: dummy),
                                secondChild: SizedBox.shrink(),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}



class AlreadyMemberList extends StatefulWidget {
  final List<dynamic> alreadyMemData;
  const AlreadyMemberList({required this.alreadyMemData});

  @override
  _AlreadyMemberListState createState() => _AlreadyMemberListState();
}

class _AlreadyMemberListState extends State<AlreadyMemberList> {
  List<int> selectedIndices = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Color(0xffF9F9F9),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'User Details',
                style: TextStyle(
                  fontFamily: 'Lato-Semibold',
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 110, 110, 110),
                ),
              ),
              Row(
                children: [
                  Text(
                    'Select All',
                    style: TextStyle(
                      fontFamily: 'Lato-Semibold',
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 110, 110, 110),
                    ),
                  ),
                  Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 237, 238, 255)
                        )
                    ),
                    checkColor: Colors.white,
                    activeColor: Color(0xff33357D),
                    value: selectedIndices.length == widget.alreadyMemData.length,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          // Select all items
                          selectedIndices = List.generate(
                            widget.alreadyMemData.length,
                                (index) => index,
                          );
                        } else {
                          // Deselect all items
                          selectedIndices.clear();
                        }
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.alreadyMemData.length,
          itemBuilder: (BuildContext context, int index) {
            Map<String, dynamic> item = widget.alreadyMemData[index];

            return GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 110, 110, 110),
                      child: Image.network(item['image']),
                    ),
                    title: Text(
                      item['name'],
                      style: TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontSize: 16,
                        color: Color.fromARGB(255, 40, 40, 40),
                      ),
                    ),
                    subtitle: Text(
                      item['phone'],
                      style: TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontSize: 12,
                        color: Color.fromARGB(255, 40, 40, 40),
                      ),
                    ),
                    trailing: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 237, 238, 255)
                          )
                      ),
                      checkColor: Colors.white,
                      activeColor: Color(0xff33357D),
                      value: selectedIndices.contains(index),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            // Select item
                            selectedIndices.add(index);
                          } else {
                            // Deselect item
                            selectedIndices.remove(index);
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}



class DummyErrorList extends StatefulWidget {
  final List<dynamic> dummyData;
  const DummyErrorList({required this.dummyData});

  @override
  _DummyErrorListState createState() => _DummyErrorListState();
}

class _DummyErrorListState extends State<DummyErrorList> {
  List<int> selectedIndices = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Color(0xffF9F9F9),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'User Details',
                style: TextStyle(
                  fontFamily: 'Lato-Semibold',
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 110, 110, 110),
                ),
              ),
              Row(
                children: [
                  Text(
                    'Select All',
                    style: TextStyle(
                      fontFamily: 'Lato-Semibold',
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 110, 110, 110),
                    ),
                  ),
                  Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 237, 238, 255)
                        )
                    ),
                    checkColor: Colors.white,
                    activeColor: Color(0xff33357D),
                    value: selectedIndices.length == widget.dummyData.length,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          // Select all items
                          selectedIndices = List.generate(
                            widget.dummyData.length,
                                (index) => index,
                          );
                        } else {
                          // Deselect all items
                          selectedIndices.clear();
                        }
                      });
                    },
                  ),

                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.dummyData.length,
          itemBuilder: (BuildContext context, int index) {
            Map<String, dynamic> item = widget.dummyData[index];

            return GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 110, 110, 110),
                      child: Image.network(item['image']),
                    ),
                    title: Text(
                      item['name'],
                      style: TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontSize: 16,
                        color: Color.fromARGB(255, 40, 40, 40),
                      ),
                    ),
                    subtitle: Text(
                      item['phone'],
                      style: TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontSize: 12,
                        color: Color.fromARGB(255, 40, 40, 40),
                      ),
                    ),
                    trailing: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 237, 238, 255)
                          )
                      ),
                      activeColor: Color(0xff33357D),
                      checkColor: Colors.white,
                      value: selectedIndices.contains(index),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            // Select item
                            selectedIndices.add(index);
                          } else {
                            // Deselect item
                            selectedIndices.remove(index);
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}