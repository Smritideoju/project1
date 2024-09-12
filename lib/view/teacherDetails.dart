import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_2/provider/teacher_provider.dart';

class TeacherDetails extends StatefulWidget {
  const TeacherDetails({super.key});

  @override
  State<TeacherDetails> createState() => _TeacherDetailsState();
}

class _TeacherDetailsState extends State<TeacherDetails> {
  @override
  void initState() {
    getValueFromFirebase();
    super.initState();
  }
getValueFromFirebase(){

 final teacherProvider =Provider.of<TeacherProvider>(context,listen: false);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}