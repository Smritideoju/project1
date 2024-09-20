import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_2/core/helper.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/core/string_const.dart';
import 'package:test_2/custom_widgets/custom_button.dart';
import 'package:test_2/custom_widgets/custom_dropdown.dart';
import 'package:test_2/custom_widgets/customtextformfield.dart';
import 'package:test_2/provider/signup_provider.dart';
import 'package:test_2/view/login.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SignupProvider>(
        builder: (context, signFormProvider, child) => SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextformfield(
                    labelText: nameStr,
                    onChanged: (value) {
                      signFormProvider.name = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return nameValidation;
                      }
                      return null;
                    },
                  ),
                  CustomTextformfield(
                    labelText: usernameStr,
                    onChanged: (value) {
                      signFormProvider.username = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return usernameValidation;
                      }
                      return null;
                    },
                  ),
                  CustomTextformfield(
                    labelText: contactStr,
                    suffixIcon: Icon(Icons.call),
                    onChanged: (value) {
                      signFormProvider.contact = value;
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
                      signFormProvider.password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return passwordValidation;
                      }
                      return null;
                    },
                  ),
                  CustomTextformfield(
                    labelText: emailStr,
                    onChanged: (value) {
                      signFormProvider.email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return emailValidation;
                      }
                      return null;
                    },
                  ),
                  CustomDropDown(
                    itemList: signFormProvider.roleList,
                    labelText: roleStr,
                    onChanged: (value) {
                      signFormProvider.role = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return roleValidation;
                      }
                      return null;
                    },
                  ),
                  CustomDropDown(
                    itemList: signFormProvider.genderList,
                    labelText: genderStr,
                    onChanged: (value) {
                      signFormProvider.gender = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return genderValidation;
                      }
                      return null;
                    },
                  ),
                  CustomButton(
                    child:
                        signFormProvider.firebaseStatus == StatusUtils.loading
                            ? const CircularProgressIndicator()
                            : Text(submitStr),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await signFormProvider.saveUser();
                        if (signFormProvider.saveUserStatus ==
                            StatusUtils.success) {
                          showSnackbar(context, successStr);
                        } else if (signFormProvider.saveUserStatus ==
                            StatusUtils.error) {
                          showSnackbar(context, failedStr);
                        }
                      }
                    },
                  ),
                  Row(
                    children: [
                      Text("Already have an account ?"),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginForm()));
                          },
                          child: Text("Login"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
