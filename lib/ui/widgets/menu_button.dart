import 'package:ambyar_app/ui/pages/rutinan_page.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String imageUrl;
  const MenuButton({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RutinanPage(),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
