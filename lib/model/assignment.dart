class assignmentModel {
  String? subjectName;
  String? semester;
  String? faculty;
  String? title;
  String? description;

  assignmentModel(
      {this.subjectName,
      this.semester,
      this.faculty,
      this.title,
      this.description});

  assignmentModel.fromJson(Map<String, dynamic> json) {
    subjectName = json['subjectName'];
    semester = json['semester'];
    faculty = json['faculty'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subjectName'] = this.subjectName;
    data['semester'] = this.semester;
    data['faculty'] = this.faculty;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
