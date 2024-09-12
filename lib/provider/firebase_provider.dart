import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/model/form.dart';
import 'package:test_2/service/firebase_form_impl.dart';
import 'package:test_2/service/firebase_formservice.dart';

class FireBaseProvider extends ChangeNotifier {
  List<Firebase> firebaseList = [];
  List<String> genderList = ["Male", "Female", "others"];
  List<User> userList=[];

  String? name, address, contact, password, gender;
  FirebaseFormService formService=FirebaseFormServiceImpl();
  StatusUtils firebaseStatus= StatusUtils.none;
  StatusUtils getStatus=StatusUtils.none;
  StatusUtils deleteStatus=StatusUtils.none;


getDeleteStatus(StatusUtils status){
  deleteStatus=status;
  notifyListeners();
}

  getFormStatus(StatusUtils status){
    getStatus=status;
    notifyListeners();
  }
  formStatus (StatusUtils status){
    firebaseStatus=status;
    notifyListeners();
  }
   

Future<void> saveUser() async {
    if (firebaseStatus != StatusUtils.loading) {
      formStatus(StatusUtils.loading);
    }

  User user = User(
    name: name,
    address: address,
    gender: gender,
    contact: contact,
    password: password,
  );
 ApiResponse response = await formService.submitValue( user);
    if (response.statusUtils == StatusUtils.success) {
      formStatus(StatusUtils.success);
    } else if (response.statusUtils== StatusUtils.error) {
      formStatus(StatusUtils.error);
}
}
Future<void>getUser()async{
  if(getStatus!=StatusUtils.loading){
    getFormStatus(StatusUtils.loading);
  }
  ApiResponse response=await formService.getValue();
  if(response.statusUtils==StatusUtils.success){
    userList=response.data;
        getFormStatus(StatusUtils.success);
        


  }else if(response.statusUtils==StatusUtils.error){
    getFormStatus(StatusUtils.error);
  }
}

Future<void> deleteUser(String id)async{
  if (deleteStatus!=StatusUtils.loading){
    getDeleteStatus(StatusUtils.loading);
  }
  ApiResponse response=await formService.deleteStudentById(id);
  if (response.statusUtils==StatusUtils.success){
    getDeleteStatus(StatusUtils.success);
  }else if(response.statusUtils==StatusUtils.error){
    getDeleteStatus(StatusUtils.error);
  }
}
}