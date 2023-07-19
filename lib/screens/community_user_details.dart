import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phonenumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _zipCodeController = TextEditingController();
  TextEditingController _constituencyController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _villageCityController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  late DateTime _dateOfBirth;
  String? _gender;
  String? _religion;
  String? _state;
  String? _district;

  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateOfBirth = DateTime.now();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _dateOfBirth,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      setState(() {
        _dateOfBirth = pickedDate;
        _dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  List<String> religions = [
    'Hindu',
    'Sikh',
    'Christian',
    'Islam',
    'Jain',
    'Others',
  ];

  bool validateTextField(String? name) {
    final RegExp regex = RegExp(r'^[a-zA-Z ]+$');
    return regex.hasMatch(name!) && name.trim().isNotEmpty;
  }

  bool isValidEmail(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }
    const pattern = r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
    final regex = RegExp(pattern);

    return regex.hasMatch(email);
  }

  bool isValidPhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return false;
    }
    final sanitizedPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');
    return sanitizedPhoneNumber.length == 10;
  }

  bool isValidZipCode(String? zipCode) {
    if (zipCode == null || zipCode.isEmpty) {
      return false;
    }
    final sanitizedZipCode = zipCode.replaceAll(RegExp(r'\D'), '');
    return sanitizedZipCode.length == 6;
  }

  String? _nameError;
  String? _phoneError;
  String? _emailError;
  String? _dateError;
  String? _genderError;
  String? _zipcodeError;
  String? _contituencyError;
  String? _countryError;
  String? _cityError;
  String? _addressError;



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
          "User Details",
          style: TextStyle(
            color: Color.fromARGB(255, 40, 40, 40),
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato-Black',
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child:SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(
                              color: Color.fromARGB(255, 237, 238, 255)
                          )
                      ),
                      shadowColor: Color.fromRGBO(45, 47, 116, 0.4),
                      elevation: 8,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                                  Text(
                                      "Personal Information",
                                      style: TextStyle(
                                        fontFamily: 'Lato-Bold',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 40, 40, 40),
                                      ),
                                    ),
                                SizedBox(height: 30,),
                              const Text(
                                "Name",
                                style: TextStyle(
                                  fontFamily: 'Lato-Regular',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255,110,110,110),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              TextFormField(
                                style: TextStyle(
                                  fontFamily: 'Roboto-Regular',
                                  fontSize: 18,
                                ),
                                controller: _nameController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(51, 53 , 125, 0.2)
                                      )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255,241,241,241),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Color(0x00f9f9f9),
                                  hintText: 'Full Name',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 18,
                                      color: Color.fromARGB(255,217,217,217)
                                  ),
                                  errorText: _nameError,
                                  errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontFamily: 'Roboto-Light'
                                  ),
                                ),
                                validator: (value) {
                                  if (!validateTextField(value)) {
                                    setState(() {
                                      _nameError = 'Please Enter Your Name'; // Set the error message
                                    });
                                  }
                                  else{
                                    setState(() {
                                      _nameError = null;
                                    });
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _nameController.text = value!;
                                },
                              ),
                              SizedBox(height: 16.0),
                              const Text(
                                "Phone Number",
                                style: TextStyle(
                                  fontFamily: 'Lato-Regular',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255,110,110,110),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              TextFormField(
                                controller: _phonenumberController,
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
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255,241,241,241),
                                    ),
                                  ),
                                  filled: true,
                                 fillColor: Color(0x00f9f9f9),
                                  hintText: '10 digit number',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 18,
                                      color: Color.fromARGB(255,217,217,217)
                                  ),
                                  errorText: _phoneError,
                                  errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontFamily: 'Roboto-Light'
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'Roboto-Regular',
                                  fontSize: 18,
                                ),
                                validator: (value) {
                                  if (!isValidPhoneNumber(value)) {
                                    setState(() {
                                      _phoneError = 'Please enter your mobile number';
                                    });
                                  }
                                  else{
                                    setState(() {
                                      _phoneError = null;
                                    });
                                  }
                                  return null;
                                },

                                onSaved: (value) {
                                  _phonenumberController.text = value!;
                                },
                              ),
                              SizedBox(height: 16.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Email",
                                    style: TextStyle(
                                      fontFamily: 'Lato-Regular',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Color.fromARGB(255,110,110,110),
                                    ),
                                  ),
                                  Text("Optional",
                                      style: TextStyle(
                                      fontFamily: 'Lato-Regular',
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Color.fromARGB(255,110,110,110),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10.0),
                              TextFormField(
                                controller: _emailController,
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
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255,241,241,241),
                                    ),
                                  ),
                                  filled: true,
                                 fillColor: Color(0x00f9f9f9),
                                  hintText: 'xyz@gmail.com',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 18,
                                      color: Color.fromARGB(255,217,217,217)
                                  ),
                                  errorText: _emailError,
                                  errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontFamily: 'Roboto-Light'
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'Roboto-Regular',
                                  fontSize: 18,
                                ),
                                validator: (value) {
                                  if (!isValidEmail(value)) {
                                    setState(() {
                                      _emailError = 'Please enter your email';
                                    });
                                  }else{
                                    setState(() {
                                      _emailError = null;
                                    });
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _emailController.text = value!;
                                },
                              ),
                              const SizedBox(height: 16.0),
                              const Text(
                                "Date of Birth",
                                style: TextStyle(
                                  fontFamily: 'Lato-Medium',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255,110,110,110),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              TextFormField(
                                controller: _dateController,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Regular',
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
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255,241,241,241),
                                    ),
                                  ),
                                  filled: true,
                                 fillColor: Color(0x00f9f9f9),
                                  hintText: 'DD/MM/YYYY',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 18,
                                      color: Color.fromARGB(255,217,217,217)
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: ImageIcon(
                                      AssetImage('assets/commnunity_edit_poll_images/comunity_editpoll_date_icon.png'),
                                      size: 13,
                                      color: Color.fromARGB(255, 177, 177, 177),
                                    ),
                                  ),
                                  errorText: _dateError,
                                  errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontFamily: 'Roboto-Light'
                                  ),
                                ),
                                readOnly: true,
                                onTap: () {
                                  _showDatePicker(context);
                                },
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    setState(() {
                                      _dateError = 'Please select the from date';
                                    });
                                  }else{
                                    setState(() {
                                      _dateError = null;
                                    });
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),
                              const Text(
                                "Gender",
                                style: TextStyle(
                                  fontFamily: 'Lato-Regular',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255,110,110,110),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.zero,
                                child: DropdownButtonFormField2<String>(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                      fillColor: Color(0x00f9f9f9),
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(51, 53 , 125, 0.3)
                                          )
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(255,241,241,241),
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      )

                                  ),
                                  value: _gender,
                                  buttonStyleData: const ButtonStyleData(
                                    padding: EdgeInsets.only(right: 8),
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Color.fromARGB(255,80,80,80),
                                    ),
                                    iconSize: 20,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                      useSafeArea: true,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12.0),
                                        color: Color.fromARGB(255,255,255,255),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 8.0,
                                              color: Color.fromRGBO(45, 47, 116, 0.4),
                                          ), //BoxShadow
                                        ],
                                      ),
                                      elevation: 8
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                  ),
                                  hint: const Text(
                                    "Male",
                                    style: TextStyle(
                                        fontFamily: 'Roboto-Regular',
                                        fontSize: 18,
                                        color: Color.fromARGB(255,217,217,217)
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
                                      _gender = value!;
                                    });
                                  },
                                  // underline: Container(color: Colors.black,),
                                  items: const [
                                    DropdownMenuItem(child: Text('Male',
                                      style: const TextStyle(
                                        fontFamily: 'Roboto-Regular',
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 40, 40, 40),
                                      ),
                                    ), value: 'Male'),
                                    DropdownMenuItem(child: Text('Female',
                                      style: const TextStyle(
                                        fontFamily: 'Roboto-Regular',
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 40, 40, 40),
                                      ),
                                    ), value: 'Female'),
                                    DropdownMenuItem(child: Text('Others',
                                      style: const TextStyle(
                                        fontFamily: 'Roboto-Regular',
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 40, 40, 40),
                                      ),
                                    ), value: 'Others'),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Religion",
                                    style: TextStyle(
                                      fontFamily: 'Lato-Regular',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Color.fromARGB(255,110,110,110),
                                    ),
                                  ),
                                  Text("Optional",
                                    style: TextStyle(
                                      fontFamily: 'Lato-Regular',
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Color.fromARGB(255,110,110,110),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.zero,
                                child: DropdownButtonFormField2<String>(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide.none
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(51, 53 , 125, 0.3)
                                          )
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(255,241,241,241),
                                        ),
                                      ),
                                      filled: true,
                                    fillColor: Color(0x00f9f9f9),
                                  ),
                                  value: _religion,
                                  buttonStyleData: const ButtonStyleData(
                                    padding: EdgeInsets.only(right: 8),
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Color.fromARGB(255,80,80,80),
                                    ),
                                    iconSize: 20,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                      useSafeArea: true,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255,255,255,255),
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color.fromRGBO(45, 47, 116, 0.4),
                                          ), //BoxShadow
                                        ],
                                      ),
                                      elevation: 8
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                  ),
                                  hint: const Text('Hindu',
                                    style: TextStyle(
                                        fontFamily: 'Roboto-Regular',
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 217,217,217)
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromARGB(255, 40, 40, 40),
                                  ),
                                  onChanged: (String? value) {
                                    setState(() {
                                      _religion = value!;
                                    });
                                  },
                                  items: religions
                                      .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontFamily: 'Roboto-Regular',
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 40, 40, 40),
                                      ),
                                    ),
                                  ))
                                      .toList(),
                                ),
                              ),
                              const SizedBox(height: 6.0),
                            ],
                          ),
                      ),
                      ),
                    SizedBox(height: 16,),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(
                              color: Color.fromARGB(255, 237, 238, 255)
                          )
                      ),
                      shadowColor: Color.fromRGBO(45, 47, 116, 0.4),
                      elevation: 8,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Physical Address",
                              style: TextStyle(
                                fontFamily: 'Lato-Bold',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 40, 40, 40),
                              ),
                            ),
                            SizedBox(height: 16,),
                            const Text(
                              "Zipcode",
                              style: TextStyle(
                                fontFamily: 'Lato-Regular',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255,110,110,110),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: _zipCodeController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide.none
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(51, 53 , 125, 0.2)
                                    )
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255,241,241,241),
                                  ),
                                ),
                                filled: true,
                               fillColor: Color(0x00f9f9f9),
                                hintText: '6 digit pincode',
                                hintStyle: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 18,
                                    color: Color.fromARGB(255,217,217,217)
                                ),
                                errorText: _zipcodeError,
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontFamily: 'Roboto-Light'
                                ),
                              ),
                              style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontSize: 18,
                              ),
                              validator: (value) {
                                if (!isValidZipCode(value)) {
                                  setState(() {
                                    setState(() {
                                      _zipcodeError = 'Please enter you zipcode';
                                    });
                                  });
                                }else{
                                  setState(() {
                                    _zipcodeError = null;
                                  });
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _zipCodeController.text = value!;
                              },
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Constituency",
                                  style: TextStyle(
                                    fontFamily: 'Lato-Regular',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromARGB(255,110,110,110),
                                  ),
                                ),
                                Text("Optional",
                                  style: TextStyle(
                                    fontFamily: 'Lato-Regular',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromARGB(255,110,110,110),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: _constituencyController,
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
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255,241,241,241),
                                  ),
                                ),
                                filled: true,
                               fillColor: Color(0x00f9f9f9),
                                hintText: 'Bhoa',
                                hintStyle: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 18,
                                    color: Color.fromARGB(255,217,217,217)
                                ),
                                errorText: _contituencyError,
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontFamily: 'Roboto-Light'
                                ),
                              ),
                              style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontSize: 18,
                              ),
                              validator: (value) {
                                if (!validateTextField(value)) {
                                  setState(() {
                                    _contituencyError = 'Please Enter Your Constituency';
                                  });
                                }else{
                                  setState(() {
                                    _contituencyError = null;
                                  });
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _constituencyController.text = value!;
                              },
                            ),
                            SizedBox(height: 16.0),
                                const Text(
                                  "Country",
                                  style: TextStyle(
                                    fontFamily: 'Lato-Regular',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromARGB(255,110,110,110),
                                  ),
                                ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: _countryController,
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
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255,241,241,241),
                                  ),
                                ),
                                filled: true,
                               fillColor: Color(0x00f9f9f9),
                                hintText: 'India',
                                hintStyle: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 18,
                                    color: Color.fromARGB(255,217,217,217)
                                ),
                                errorText: _countryError,
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontFamily: 'Roboto-Light'
                                ),
                              ),
                              style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontSize: 18,
                              ),
                              validator: (value) {
                                if (!validateTextField(value)) {
                                  setState(() {
                                    _countryError = 'Please Enter Your Country Name';
                                  });
                                }else{
                                  setState(() {
                                    _countryError = null;
                                  });
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _countryController.text = value!;
                              },
                            ),
                            const SizedBox(height: 16.0),
                            const Text(
                              "State",
                              style: TextStyle(
                                fontFamily: 'Lato-Medium',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255,110,110,110),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Padding(
                              padding: EdgeInsets.zero,
                              child: DropdownButtonFormField2<String>(
                                isExpanded: true,
                                decoration: InputDecoration(
                                    fillColor: Color(0x00f9f9f9),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(51, 53 , 125, 0.3)
                                        )
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255,241,241,241),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    )
                                ),
                                value: _state,
                                buttonStyleData: const ButtonStyleData(
                                  padding: EdgeInsets.only(right: 8),
                                ),
                                iconStyleData: const IconStyleData(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Color.fromARGB(255,80,80,80),
                                  ),
                                  iconSize: 20,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                    useSafeArea: true,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255,255,255,255),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 3.0,
                                            color: Color.fromRGBO(45, 47, 116, 0.4),
                                        ), //BoxShadow
                                      ],
                                    ),
                                    elevation: 1
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                ),
                                hint: const Text(
                                  "Uttar Pradesh",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 18,
                                      color: Color.fromARGB(255,217,217,217)
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
                                    _state = value!;
                                  });
                                },
                                // underline: Container(color: Colors.black,),
                                items: indianStates
                                    .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Color.fromARGB(255, 40, 40, 40),
                                    ),
                                  ),
                                ))
                                    .toList(),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            const Text(
                              "District",
                              style: TextStyle(
                                fontFamily: 'Lato-Regular',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255,110,110,110),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.zero,
                              child: DropdownButtonFormField2<String>(
                                isExpanded: true,
                                decoration: InputDecoration(
                                    fillColor: Color(0x00f9f9f9),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(51, 53 , 125, 0.5)
                                        )
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255,241,241,241),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    )
                                ),
                                value: _district,
                                buttonStyleData: const ButtonStyleData(
                                  padding: EdgeInsets.only(right: 8),
                                ),
                                iconStyleData: const IconStyleData(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Color.fromARGB(255,80,80,80),
                                  ),
                                  iconSize: 20,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                    useSafeArea: true,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255,255,255,255),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 3.0,
                                            color: Color.fromRGBO(45, 47, 116, 0.4),
                                        ), //BoxShadow
                                      ],
                                    ),
                                    elevation: 8
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                ),
                                hint: const Text(
                                  "Agra",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 18,
                                      color: Color.fromARGB(255,217,217,217)
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
                                    _district = value!;
                                  });
                                },
                                // underline: Container(color: Colors.black,),
                                items: const [
                                  DropdownMenuItem(child: Text('Agra',
                                    style: const TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Color.fromARGB(255, 40, 40, 40),
                                    ),
                                  ), value: 'Agra'),
                                  DropdownMenuItem(child: Text('Paryagraj',
                                    style: const TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Color.fromARGB(255, 40, 40, 40),
                                    ),
                                  ), value: 'Paryagraj'),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.0),
                            const Text(
                              "Village/City",
                              style: TextStyle(
                                fontFamily: 'Lato-Regular',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255,110,110,110),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: _villageCityController,
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
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255,241,241,241),
                                  ),
                                ),
                                filled: true,
                               fillColor: Color(0x00f9f9f9),
                                hintText: 'Mathura',
                                hintStyle: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 18,
                                    color: Color.fromARGB(255,217,217,217)
                                ),
                                errorText: _cityError,
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontFamily: 'Roboto-Light'
                                ),
                              ),
                              style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontSize: 18,
                              ),
                              validator: (value) {
                                if (!validateTextField(value)) {
                                  setState(() {
                                    _cityError =  'Please Enter your village/city';
                                  });
                                }else{
                                  setState(() {
                                    _cityError = null;
                                  });
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _villageCityController.text = value!;
                              },
                            ),
                            SizedBox(height: 16.0),
                            const Text(
                              "Address",
                              style: TextStyle(
                                fontFamily: 'Lato-Regular',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255,110,110,110),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: _addressController,
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
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255,241,241,241),
                                  ),
                                ),
                                filled: true,
                               fillColor: Color(0x00f9f9f9),
                                hintText: '8-B, Basement Floor, Jangpura',
                                hintStyle: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 18,
                                    color: Color.fromARGB(255,217,217,217)
                                ),
                                errorText: _addressError,
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontFamily: 'Roboto-Light'
                                ),
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontSize: 18,
                              ),
                              validator: (value) {
                                if (!validateTextField(value)) {
                                  setState(() {
                                    _addressError ='Please Enter Your Address';
                                  });
                                }else{
                                  setState(() {
                                    _addressError = null;
                                  });
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _addressController.text = value!;
                              },
                            ),
                            SizedBox(height: 16.0),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // Perform form submission or data processing here
                            // You can access the form values via the variables (_name, _mobileNumber, etc.)
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ), backgroundColor: Color.fromARGB(255,51,53,125)
                        ),
                        child: Text('Submit',
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Lato-Regular',
                            color: Color.fromARGB(255,255,255,255),
                          ),
                        ),
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

List<String> indianStates = [
  'Andhra Pradesh',
  'Arunachal Pradesh',
  'Assam',
  'Bihar',
  'Chhattisgarh',
  'Goa',
  'Gujarat',
  'Haryana',
  'Himachal Pradesh',
  'Jharkhand',
  'Karnataka',
  'Kerala',
  'Madhya Pradesh',
  'Maharashtra',
  'Manipur',
  'Meghalaya',
  'Mizoram',
  'Nagaland',
  'Odisha',
  'Punjab',
  'Rajasthan',
  'Sikkim',
  'Tamil Nadu',
  'Telangana',
  'Tripura',
  'Uttar Pradesh',
  'Uttarakhand',
  'West Bengal'
];
