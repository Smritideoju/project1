class Student {
  String? name;
  String? address;
  String? contact;
  String? gender;
  String? email;
  String? password;
  String? faculty;
  String? semester;

  Student(
      {this.name,
      this.address,
      this.contact,
      this.gender,
      this.email,
      this.password,
      this.faculty,
      this.semester});

  Student.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    contact = json['contact'];
    gender = json['gender'];
    email = json['email'];
    password = json['password'];
    faculty = json['faculty'];
    semester = json['semester'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['password'] = this.password;
    data['faculty'] = this.faculty;
    data['semester'] = this.semester;
    return data;
  }
}
