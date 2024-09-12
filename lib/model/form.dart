class User{
  String?id;
  String? name;
  String? address;
  String? contact;
  String? password;
  String? gender;

  User(
      {this.name, this.address, this.contact, this.password,this.id, this.gender});

   User.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    name = json['name'];
    address = json['address'];
    contact = json['contact'];
    password = json['password'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
   data['id']=this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['password'] = this.password;
    data['gender'] = this.gender;
    return data;
  }
}
