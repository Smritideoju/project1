class Teacher {
  String? name;
  String? address;
  String? contact;
  String? gender;
  String? password;

  Teacher({this.name, this.address, this.contact, this.gender, this.password});

  Teacher.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    contact = json['contact'];
    gender = json['gender'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['gender'] = this.gender;
    data['password'] = this.password;
    return data;
  }
}
