import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_2/core/color_const.dart';
import 'package:test_2/core/helper.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/core/string_const.dart';
import 'package:test_2/provider/firebase_provider.dart';
import 'package:test_2/provider/student_provider.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  void initState() {
    getValueFromApi();
    super.initState();
  }

  getValueFromApi() async {
    var provider = Provider.of<FireBaseProvider>(context, listen: false);

    Future.delayed(Duration.zero, () async {
      await provider.getUser();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<FireBaseProvider>(
          builder: (context, firebaseProvider, child) => Column(
            children: [
              firebaseProvider.getStatus == StatusUtils.loading
                  ? CircularProgressIndicator()
                  : firebaseProvider.userList.isEmpty ? Text("No data available"): Expanded(
                      child: ListView.builder(
                          itemCount: firebaseProvider.userList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name is ${firebaseProvider.userList[index].name}",
                                      ),
                                      Text(
                                          "Address is ${firebaseProvider.userList[index].address}"),
                                      Text(
                                          "Phone number is ${firebaseProvider.userList[index].contact}"),
                                      Text(
                                          "Password is ${firebaseProvider.userList[index].password}"),
                                      Text(
                                          "Gender is ${firebaseProvider.userList[index].gender}")
                                    ],
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.edit, color: greenColor)),
                                  IconButton(
                                      onPressed: () async {
                                        _showAlertDialog(context, index, firebaseProvider);
                                      },
                                      icon: Icon(Icons.delete, color: redColor))
                                ],
                              ),
                            );
                          }),
                    )
            ],
          ),
        ),
      ),
    );
  }
  void _showAlertDialog(BuildContext context, int index,
      FireBaseProvider firebaseFormProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Do you want to delete?'),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () async {
                await firebaseFormProvider
                    .deleteUser(firebaseFormProvider.userList[index].id ?? "");
                if (firebaseFormProvider.deleteStatus == StatusUtils.success) {
                  showSnackbar(context, deletemessageStr);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetails(),
                      ),
                      (route) => false);
                } else if (firebaseFormProvider.deleteStatus ==
                    StatusUtils.error) {
                  showSnackbar(context, deleteErrorStr);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
