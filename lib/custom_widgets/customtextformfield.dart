import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextformfield extends StatelessWidget {
  String? labelText;
  String? Function(String?)? validator;
  bool obscureText = false;
  void Function(String)? onChanged;
  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;
  Widget? suffixIcon;

  CustomTextformfield(
      {super.key, this.labelText,this.suffixIcon,this.onChanged,this.keyboardType,this.inputFormatters, this.obscureText = false, this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
       
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: labelText,
        ),
      ),
    );
  }
}
