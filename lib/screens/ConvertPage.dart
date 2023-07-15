import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/users.dart';

class ConvertPageScreen extends StatefulWidget {
  const ConvertPageScreen({super.key});

  @override
  State<ConvertPageScreen> createState() => _ConvertPageScreenState();
}

class _ConvertPageScreenState extends State<ConvertPageScreen> {

  void handleProceed(){
    Navigator.pushNamed(context, '');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 40, 40, 40)),
            ),
            const Text(
              "Invite Members",
              style: TextStyle(
                color: Color.fromARGB(255, 40, 40, 40),
                fontWeight: FontWeight.normal,
                fontFamily: 'Lato-Black',
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: handleProceed,
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
      body: Column(
        children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: UserTable()
          ),
        ],
      ),
    );
  }
}

class UserTable extends StatefulWidget {
  @override
  _UserTableState createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {

  Future<List<User>> fetchUserData() async {
    final response = await http.get(Uri.parse('http://10.0.50.56:8080/users'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  late Future<List<User>> _usersFuture;
  List<DataColumn> _columns = [];
  List<User> _users = [];
  int _currentPage = 0;
  final int _itemsPerPage = 15;

  @override
  void initState() {
    super.initState();
    _usersFuture = fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: _usersFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          _users = snapshot.data!;
          if (_columns.isEmpty) {
            final user = User(
              name: 'Sample Name',
              phoneNumber: 1234567890,
              email: 'sample@example.com',
              dob: '10-01-2001',
              gender: 'Male',
              religion: 'Christian',
              zipcode: 12345,
              constituency: 'Sample Constituency',
              country: 'Sample Country',
              state: 'Sample State',
              district: 'Sample District',
              city: 'Sample City',
              address: 'Sample Address',
            );
            _columns = user.toJson().keys.map((key) {
              return DataColumn(label: Text(key));
            }).toList();
          }
          final totalItems = _users.length;
          final totalPages = (totalItems / _itemsPerPage).floor();

          final startIndex = _currentPage * _itemsPerPage;
          final endIndex = (startIndex + _itemsPerPage).clamp(0, totalItems);

          final usersOnPage = _users.sublist(startIndex, endIndex);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    DataTable(
                      columns: _columns,
                      rows: usersOnPage.map((user) {
                        final cells = user.toJson().entries.map((entry) {
                          final value = entry.value.toString();
                          return DataCell(
                            TextFormField(
                              initialValue: value,
                            ),
                          );
                        }).toList();
                        return DataRow(cells: cells);
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        color: Color.fromARGB(255, 40, 40, 40)),
                    onPressed: _currentPage > 0
                        ? () {
                      setState(() {
                        _currentPage--;
                      });
                    }
                        : null,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          '${_currentPage + 1}/$totalPages',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 40, 40, 40),
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            fontFamily: 'Lato-Black',
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios,
                        color: Color.fromARGB(255, 40, 40, 40)),
                    onPressed: _currentPage < totalPages - 1
                        ? () {
                      setState(() {
                        _currentPage++;
                      });
                    }
                        : null,
                  ),
                ],
              ),
            ],
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return const Center(child: Text('Error: No Data Available'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
