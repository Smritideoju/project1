import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_2/core/helper.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/core/string_const.dart';
import 'package:test_2/custom_widgets/custom_button.dart';
import 'package:test_2/custom_widgets/customtextformfield.dart';
import 'package:test_2/provider/login_provider.dart';
import 'package:test_2/view/assignment.dart';
import 'package:test_2/view/product_details.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Consumer<LoginProvider>(
              builder: (context, loginProvider, child) => Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      
                          child: Column(children: [
                   CustomTextformfield(
                    labelText: emailStr,
                    suffixIcon: Icon(Icons.email),
                    onChanged: (value) {
                      loginProvider.email=value;
                    },
                    validator: (value) {
                      if(value!.isEmpty){
                        return emailValidation;
                      } return null;
                      
                    },
                   ),
                   CustomTextformfield(
                    labelText: passwordStr,
                    suffixIcon: Icon(Icons.visibility_off),
                    obscureText: false,
                    onChanged: (value) {
                      loginProvider.password=value;
                    },
                    
                   ),
                    CustomButton(
                      child: loginProvider.setLoginStatus == StatusUtils.loading
                          ? const CircularProgressIndicator()
                          : Text(submitStr),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await loginProvider.saveLogin();
                          if (loginProvider.setLoginStatus ==
                              StatusUtils.success) {
                            showSnackbar(context, loginsuccessStr);
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Assignment(),), (route) => false);
                          } else if (loginProvider.setLoginStatus ==
                              StatusUtils.error) {
                            showSnackbar(context, loginfailedStr);
                          }
                        }
                      },
                    ),
                  ])))),
        ));
  }
}
