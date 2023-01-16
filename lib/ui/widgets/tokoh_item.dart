import 'package:ambyar_app/shared/theme.dart';
import 'package:flutter/material.dart';

class TokohItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String tempat;
  const TokohItem({
    Key? key,
    required this.title,
    required this.tempat,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kInactiveColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  imageUrl,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                tempat,
                style: whiteTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
