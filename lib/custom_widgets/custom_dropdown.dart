import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  List<String> itemList;
  void Function(String?)? onChanged;
  String? Function(String?)? validator;
  String? labelText;
  CustomDropDown({
    super.key,
    this.labelText,
    required this.itemList,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField(
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: labelText,
            labelStyle: TextStyle(fontSize: 15)),
        onChanged: onChanged,
        items: itemList
            .map((item) => DropdownMenuItem(
                  child: Text(item),
                  value: item,
                ))
            .toList(),
      ),
    );
  }
}
