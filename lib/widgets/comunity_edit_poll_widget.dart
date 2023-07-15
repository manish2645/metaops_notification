import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDialog extends StatefulWidget {
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late DateTime _selectedDate;
  final TextEditingController _dateController = TextEditingController();
  String? _visibleOption;
  String? _resultVisibilityOption;

  final List<String> genderItems = [
    'Male',
    'Female',
  ];


  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _selectedDate = DateTime.now();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  // Date picker
  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width*0.40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                padding: EdgeInsets.symmetric(vertical: 8),
                controller: _tabController,
                isScrollable: true,
                indicatorColor: const Color.fromARGB(255, 51, 53, 125),
                indicatorPadding: EdgeInsets.zero,
                labelColor: const Color.fromARGB(255, 51, 53, 125),
                unselectedLabelColor: const Color.fromARGB(255, 40, 40, 40),
                tabs: const [
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Voting',
                          style: TextStyle(
                            fontFamily: 'Roboto-Regular',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Results',
                          style: TextStyle(
                            fontFamily: 'Roboto-Regular',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),Divider(height: 1, thickness: 0.5,),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Close poll on schedule date",
                        style: TextStyle(
                          fontFamily: 'Lato-Medium',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 40, 40, 40),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      TextFormField(
                        controller: _dateController,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Roboto-Light',
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(51, 53 , 125, 0.2)
                              )
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255,249,249,249),
                          labelText: 'dd-mm-yyyy',
                          labelStyle: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Roboto-Light',
                              color: Color.fromARGB(255,173,173,173)
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ImageIcon(
                              AssetImage('assets/commnunity_edit_poll_images/comunity_editpoll_date_icon.png'),
                              size: 13,
                              color: Color.fromARGB(255, 177, 177, 177),
                            ),
                          ),
                        ),
                        readOnly: true,
                        onTap: () {
                          _showDatePicker(context);
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select the from date';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                //Result Tab
                Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "No.of Participants",
                          style: TextStyle(
                            fontFamily: 'Lato-Regular',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 40, 40, 40),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.zero,
                          child: DropdownButtonFormField2<String>(
                            isExpanded: true,
                            decoration: InputDecoration(
                                fillColor: Color.fromARGB(255,249,249,249),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(51, 53 , 125, 0.3)
                                    )
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                )
                            ),
                            value: _visibleOption,
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(right: 8),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 20,
                            ),
                            dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3.0,
                                        color: Color.fromARGB(255,40,40,40)
                                    ), //BoxShadow
                                  ],
                                ),
                                elevation: 1
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                            ),

                            // isExpanded: true,
                            hint: const Text(
                              "Visible",
                              style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 40, 40, 40),
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 40, 40, 40),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _visibleOption = value;
                              });
                            },
                            // underline: Container(color: Colors.black,),
                            items: const [
                              DropdownMenuItem(child: Text('Visible',
                                style: const TextStyle(
                                  fontFamily: 'Roboto-Regular',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 40, 40, 40),
                                ),
                              ), value: 'Visible'),
                              DropdownMenuItem(child: Text('Not Visible',
                                style: const TextStyle(
                                  fontFamily: 'Roboto-Regular',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 40, 40, 40),
                                ),
                              ), value: 'Not Visible'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Result Visibility",
                          style: TextStyle(
                            fontFamily: 'Lato-Regular',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 40, 40, 40),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.zero,
                          child: DropdownButtonFormField2<String>(
                            isExpanded: true,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(51, 53 , 125, 0.3)
                                    )
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(255,249,249,249)
                            ),
                            value: _resultVisibilityOption,
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(right: 8),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 20,
                            ),
                            dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3.0,
                                        color: Color.fromARGB(255,40,40,40)
                                    ), //BoxShadow
                                  ],
                                ),
                                elevation: 1
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                            ),
                            hint: const Text('Public after vote',
                              style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 40, 40, 40),
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 40, 40, 40),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _resultVisibilityOption = value;
                              });
                            },
                            items: const [
                              DropdownMenuItem(child: Text('Public after vote',
                                style: const TextStyle(
                                  fontFamily: 'Roboto-Regular',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 40, 40, 40),
                                ),
                              ), value: 'Public after vote'),
                              DropdownMenuItem(child: Text('Private after vote',
                                style: const TextStyle(
                                  fontFamily: 'Roboto-Regular',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 40, 40, 40),
                                ),
                              ), value: 'Private after vote'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}