import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_2/core/color_const.dart';
import 'package:test_2/core/helper.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/core/string_const.dart';
import 'package:test_2/custom_widgets/custom_button.dart';
import 'package:test_2/custom_widgets/custom_dropdown.dart';
import 'package:test_2/custom_widgets/customtextformfield.dart';
import 'package:test_2/provider/teacher_provider.dart';

class TeacherForm extends StatefulWidget {
  const TeacherForm({super.key});

  @override
  State<TeacherForm> createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(teacherStr),
        backgroundColor: teachColor,
      ),
      body: Consumer<TeacherProvider>(
        builder: (context, teacherProvider, child) => Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextformfield(
                labelText: nameStr,
                onChanged: (value) {
                  teacherProvider.name = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return nameValidation;
                  }
                  return null;
                },
              ),
              CustomTextformfield(
                labelText: addressStr,
                onChanged: (value) {
                  teacherProvider.address = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return addressValidation;
                  }
                  return null;
                },
              ),
              CustomTextformfield(
                labelText: contactStr,
                suffixIcon: Icon(Icons.call),
                onChanged: (value) {
                  teacherProvider.contact = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return contactValidation;
                  } else if (value.length < 10) {
                    return contactValidation;
                  }
                  return null;
                },
              ),
              CustomTextformfield(
                labelText: passwordStr,
                onChanged: (value) {
                  teacherProvider.password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return passwordValidation;
                  } else if (value.length < 10) {
                    return passwordValidation;
                  }
                  return null;
                },
              ),
              CustomButton(
                child: teacherProvider.saveTeacherStatus == StatusUtils.loading
                    ? CircularProgressIndicator(
                        color: primaryColor,
                      )
                    : Text(submitStr),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await teacherProvider.saveTeacherData();
                    if (teacherProvider.saveTeacherStatus ==
                        StatusUtils.success) {
                      showSnackbar(context, successStr);
                    } else if (teacherProvider.saveTeacherStatus ==
                        StatusUtils.error) {
                      showSnackbar(context, failedStr);
                    }
                  }
                },
                foregroundColor: redColor,
                backgroundColor: primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
