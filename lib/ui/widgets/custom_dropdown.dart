import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomDropdown extends StatelessWidget {
  final TextEditingController controller;

  const CustomDropdown({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          DropdownSearch<String>(
            clearButtonProps: ClearButtonProps(
              isVisible: true,
            ),
            items: [
              "Alam Jaya",
              "Gandasari",
              "Jatake",
              "Keroncong",
              "Pasir Jaya",
              'Manis Jaya',
            ],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                hintText: "Pilih ranting asal anda",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    defaultRadius,
                  ),
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            onChanged: print,
          ),
        ],
      ),
    );
  }
}
