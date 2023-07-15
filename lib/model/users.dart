class User {
  String name;
  int phoneNumber;
  String email;
  String dob;
  String gender;
  String religion;
  int zipcode;
  String constituency;
  String country;
  String state;
  String district;
  String city;
  String address;

  User({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.dob,
    required this.gender,
    required this.religion,
    required this.zipcode,
    required this.constituency,
    required this.country,
    required this.state,
    required this.district,
    required this.city,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      phoneNumber: json['ph_number'],
      email: json['email'],
      dob: json['dob'],
      gender: json['gender'],
      religion: json['religion'],
      zipcode: json['zipcode'],
      constituency: json['constituency'],
      country: json['country'],
      state: json['state'],
      district: json['district'],
      city: json['city'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ph_number': phoneNumber,
      'email': email,
      'dob': dob,
      'gender': gender,
      'religion': religion,
      'zipcode': zipcode,
      'constituency': constituency,
      'country': country,
      'state': state,
      'district': district,
      'city': city,
      'address': address,
    };
  }
}
