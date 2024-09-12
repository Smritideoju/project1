import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_2/core/helper.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/core/string_const.dart';
import 'package:test_2/custom_widgets/custom_button.dart';
import 'package:test_2/custom_widgets/custom_dropdown.dart';
import 'package:test_2/custom_widgets/customtextformfield.dart';
import 'package:test_2/provider/student_provider.dart';

class StudentForm extends StatelessWidget {
  StudentForm({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<StudentProvider>(
          builder: (context, StudentProvider, child) => Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextformfield(
                  labelText: nameStr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return nameValidation;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    StudentProvider.name = value;
                  },
                ),
                CustomTextformfield(
                  labelText: addressStr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return addressValidation;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    StudentProvider.address = value;
                  },
                ),
                CustomTextformfield(
                  labelText: contactStr,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return contactValidation;
                    } else if (value.length < 10) {}
                    return null;
                  },
                  onChanged: (value) {
                    StudentProvider.contact = value;
                  },
                ),
                CustomTextformfield(
                  labelText: emailStr,
                  onChanged: (value) {
                    StudentProvider.email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return emailValidation;
                    }
                    return null;
                  },
                ),
                CustomTextformfield(
                  labelText: passwordStr,
                  validator: (value) {
                    if (value!.isEmpty) {
                    } else if (value.length < 7) {
                      return passwordlengthStr;
                    } else if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value)) {
                      return passwordMatchStr;
                    }

                    return null;
                  },
                  onChanged: (value) {
                    StudentProvider.password = value;
                  },
                ),
                CustomDropDown(
                  itemList: StudentProvider.semseterList,
                  labelText: semesterStr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return semesterValidation;
                    }
                  },
                  onChanged: (value) {
                    StudentProvider.semester = value;
                  },
                ),
                CustomDropDown(
                  itemList: StudentProvider.genderList,
                  labelText: genderStr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return genderValidation;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    StudentProvider.gender = value;
                  },
                ),
                CustomDropDown(
                  itemList: StudentProvider.facultyList,
                  labelText: facultyStr,
                  onChanged: (value) {
                    StudentProvider.faculty = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return facultyValidation;
                    }
                    return null;
                  },
                ),
                CustomButton(
                    child: StudentProvider.saveUserStatus == StatusUtils.loading
                        ? CircularProgressIndicator()
                        : Text("submit"),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await StudentProvider.saveUser();
                        if(StudentProvider.saveUserStatus==StatusUtils.success){
                          showSnackbar(context, successStr);
                        }else if(StudentProvider.saveUserStatus==StatusUtils.error){
                          showSnackbar(context,failedStr);
                        }
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
