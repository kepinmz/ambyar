import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class DetailAgendaItem extends StatelessWidget {
  final String title;
  final String detail;
  final String imageUrl;
  const DetailAgendaItem({
    Key? key,
    required this.title,
    required this.detail,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
              ),
            ),
          ),
          Text(
            title,
            style: whiteTextStyle,
          ),
          Spacer(),
          Text(
            detail,
            style: whiteTextStyle,
          ),
        ],
      ),
    );
  }
}
