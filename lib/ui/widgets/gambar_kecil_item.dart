import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class GambarKecilItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  const GambarKecilItem({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  imageUrl,
                ),
              ),
            ),
          ),
          Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
          ),
        ],
      ),
    );
  }
}
