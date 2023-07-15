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
              // Implement the onTap functionality
            },
            child: Container(
              margin: const EdgeInsets.all(15),
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 40, 40, 40)),
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: const Center(
                child: Text(
                  'Invite',
                  style: TextStyle(
                    color: Color.fromARGB(255, 40, 40, 40),
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