import 'package:flutter/material.dart';
import 'package:test_2/core/string_const.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onPressed,this.child,this.foregroundColor,this.backgroundColor});
  void Function()? onPressed;
  Color? foregroundColor;

   Widget? child;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(12)),
                foregroundColor: foregroundColor,
                backgroundColor:backgroundColor ),
        onPressed: onPressed,
        child:child );
  }
}
