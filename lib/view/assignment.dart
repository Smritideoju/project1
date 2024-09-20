import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_2/core/helper.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/core/string_const.dart';
import 'package:test_2/custom_widgets/custom_button.dart';
import 'package:test_2/custom_widgets/custom_dropdown.dart';
import 'package:test_2/custom_widgets/customtextformfield.dart';
import 'package:test_2/provider/assignment_provider.dart';
import 'package:test_2/view/product_details.dart';

class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State<Assignment> createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Consumer<AssignmentProvider>(
          builder: (context, assignmentProvider, child) => Column(
            children: [
              CustomDropDown(
                itemList: assignmentProvider.subjectNameList,
                labelText: subjectNameStr,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return subjectNameValidation;
                  }
                },
                onChanged: (value) {
                  assignmentProvider.subjectName = value;
                },
              ),
              CustomDropDown(
                itemList: assignmentProvider.semseterList,
                labelText: semesterStr,
                validator: (value) {
                  if (value!.isEmpty) {
                    return semesterValidation;
                  }
                },
                onChanged: (value) {
                  assignmentProvider.semester = value;
                },
              ),
              CustomDropDown(
                itemList: assignmentProvider.facultyList,
                labelText: facultyStr,
                onChanged: (value) {
                  assignmentProvider.faculty = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return facultyValidation;
                  }
                  return null;
                },
              ),
              CustomTextformfield(
                labelText: titleStr,
                onChanged: (value) {
                  assignmentProvider.title = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return titleValidation;
                  }
                  return null;
                },
              ),
              CustomTextformfield(
                labelText: descriptionStr,
                onChanged: (value) {
                  assignmentProvider.description = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return descriptionValidation;
                  }
                  return null;
                },
              ),
              CustomButton(
                      child: assignmentProvider.setAssigStatus == StatusUtils.loading
                          ? const CircularProgressIndicator()
                          : Text(submitStr),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await assignmentProvider.saveAssignment();
                          if (assignmentProvider.setAssigStatus ==
                              StatusUtils.success) {
                            showSnackbar(context, assignmentSuccess);
                          } else if (assignmentProvider.setAssigStatus ==
                              StatusUtils.error) {
                            showSnackbar(context, assignmentFailed);
                          }
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
