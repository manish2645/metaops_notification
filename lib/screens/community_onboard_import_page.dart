import 'package:flutter/material.dart';

class ImportPage extends StatefulWidget {
  const ImportPage({Key? key}) : super(key: key);

  @override
  State<ImportPage> createState() => _ImportPageState();
}
List<Map<String, dynamic>> createSampleJsonData() {
  List<Map<String, dynamic>> jsonData = [
    {
      'NAME': 'Sourav Das',
      'GENDER': 'Male',
      'PINCODE': 112255,
      'PHONE NUMBER': '8855996633',
      'DATE OF BIRTH': '15/05/2007',
      'EMAIL': 'sourav@gmail.com',
    },
    {
      'NAME': 'Muzeeb Ur Rehman',
      'GENDER': 'Male',
      'PINCODE': 154687,
      'PHONE NUMBER': '7744112288',
      'DATE OF BIRTH': '17/08/1932',
      'EMAIL': 'rehman@gmail,com',
    },
    {
      'NAME': 'Muzeeb Ur Rehman',
      'GENDER': 'Male',
      'PINCODE': 154687,
      'PHONE NUMBER': '7744112288',
      'DATE OF BIRTH': '17/08/1933',
      'EMAIL': 'rehman@gmail.com',
    },
    {
      'NAME': 'Muzeeb Ur Rehman',
      'GENDER': 'Male',
      'PINCODE': 154687,
      'PHONE NUMBER': '7744112288',
      'DATE OF BIRTH': '17/08/1933',
      'EMAIL': 'rehman@gmail.com',
    },
    {
      'NAME': 'Muzeeb Ur Rehman',
      'GENDER': 'Male',
      'PINCODE': 154687,
      'PHONE NUMBER': '7744112288',
      'DATE OF BIRTH': '17/08/1933',
      'EMAIL': 'rehman@gmail.com',
    },
    {
      'NAME': 'Muzeeb Ur Rehman',
      'GENDER': 'Male',
      'PINCODE': 154687,
      'PHONE NUMBER': '7744112288',
      'DATE OF BIRTH': '17/08/1933',
      'EMAIL': 'rehman@gmail.com',
    },
    {
      'NAME': 'Muzeeb Ur Rehman',
      'GENDER': 'Male',
      'PINCODE': 154687,
      'PHONE NUMBER': '7744112288',
      'DATE OF BIRTH': '17/08/1933',
      'EMAIL': 'rehman@gmail.com',
    },
    {
      'NAME': 'Muzeeb Ur Rehman',
      'GENDER': 'Male',
      'PINCODE': 154687,
      'PHONE NUMBER': '7744112288',
      'DATE OF BIRTH': '17/08/1933',
      'EMAIL': 'rehman@gmail.com',
    },

  ];

  return jsonData;
}


class _ImportPageState extends State<ImportPage> {
  List<Map<String, dynamic>> jsonData = [];

  @override
  void initState() {
    super.initState();
    jsonData = createSampleJsonData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Imported File",
          style: TextStyle(
            color: Color.fromARGB(255, 40, 40, 40),
            fontWeight: FontWeight.normal,
            fontFamily: 'Lato-Black',
            fontSize: 18,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  insetPadding: const EdgeInsets.all(5),
                  contentPadding: const EdgeInsets.all(5),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  content: Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      width: MediaQuery.of(context).size.width*0.60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                icon: Image.asset(
                                  'assets/commnunity_edit_poll_images/comunity_notify_cross_icon.png',
                                  height: 14,
                                  width: 14,
                                )
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/community_popup_images/community_invite_popup_icon.png',
                                  height: 120,
                                  width: 120,),
                                  Text(
                                    "Invitation Status !",
                                    style: TextStyle(
                                      color: Color.fromARGB(255,51,53,125),
                                      fontSize: 16,
                                      fontFamily: 'Roboto-Bold',
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Successfully Invited: ",
                                        style: TextStyle(
                                            color: Color.fromRGBO(40,40,40,0.5),
                                            fontSize: 12,
                                            fontFamily: 'Lato-Semibold'
                                        ),
                                      ),
                                      Text(
                                        "150",
                                        style: TextStyle(
                                            color: Color(0xff35A335),
                                            fontSize: 12,
                                            fontFamily: 'Roboto-Bold'
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Invitation Failure: ",
                                        style: TextStyle(
                                            color: Color.fromRGBO(40,40,40,0.5),
                                            fontSize: 12,
                                            fontFamily: 'Lato-Semibold'
                                        ),
                                      ),
                                      Text(
                                        "50",
                                        style: TextStyle(
                                            color: Color(0xffE64E2F),
                                            fontSize: 12,
                                            fontFamily: 'Roboto-Bold'
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  SizedBox(
                                    width: 130,
                                    height: 35,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/invitation_detail');
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(255,51,53,125),
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                          )
                                      ),
                                      child: const Text('See Details',
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
                            ),
                          ),

                        ],
                      )
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(15),
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff33357D)),
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: const Color(0xff33357D)
              ),
              child: const Center(
                child: Text(
                  'Invite',
                  style: TextStyle(
                    color: Color.fromARGB(255,255,255,255),
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    fontFamily: 'Lato-Black',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0x0033357d)), // Add table border
            ),
            columns: [
              DataColumn(
                label: const Text('Serial No.'),
                numeric: true,
              ),
              ...jsonData.first.keys.map(
                    (header) => DataColumn(
                  label: Text(
                    header,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
            rows: jsonData.asMap().entries.map(
                  (entry) {
                final rowIndex = entry.key;
                final row = entry.value;
                return DataRow(
                  cells: [
                    DataCell(Text((rowIndex + 1).toString())),
                    ...row.entries.map(
                          (cellEntry) {
                        final columnName = cellEntry.key;
                        final cellValue = cellEntry.value;
                        return DataCell(
                          TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                isCollapsed: false
                            ),
                            style: const TextStyle(
                              fontFamily: 'Lato-Black',
                              fontWeight: FontWeight.normal,
                            ),
                            initialValue: cellValue.toString(),
                            onChanged: (newValue) {
                              setState(() {
                                jsonData[rowIndex][columnName] = newValue;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}