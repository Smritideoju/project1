import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/provider/student_provider.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  void initState() {
    getValueFromApi();
    super.initState();
  }

  getValueFromApi() async {
    var provider = Provider.of<StudentProvider>(context, listen: false);

    Future.delayed(Duration.zero, () async {
      await provider.getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Consumer<StudentProvider>(
            builder: (context, studentProvider, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    studentProvider.getUserStatus == StatusUtils.loading
                        ? const CircularProgressIndicator()
                        : Expanded(
                            child: ListView.builder(
                                itemCount: studentProvider.studentList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Name is : ${studentProvider.studentList[index].name}")
                                      ],
                                    ),
                                  );
                                }))
                  ],
                )));
  }
}
