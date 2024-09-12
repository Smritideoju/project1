import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


  showSnackbar(BuildContext context, String message) {
    var snackBar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

isInternetAvailable()async{
  bool result = await InternetConnectionChecker().hasConnection;
return result;
}