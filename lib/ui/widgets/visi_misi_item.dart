import 'package:flutter/material.dart';
import 'package:ambyar_app/ui/pages/get_started_page.dart';
import '../../shared/theme.dart';

class VisiMisiItem extends StatelessWidget {
  final String text;
  const VisiMisiItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8,
      ),
      child: Text(text, style: whiteTextStyle),
    );
  }
}
