import 'package:ambyar_app/ui/widgets/rutinan_item.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class RutinanPage extends StatelessWidget {
  const RutinanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget contentRutinan() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          children: [
            Text(
              'Rutinan',
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            RutinanItem(
              title: 'Kajian Fiqih',
              waktu: 'Senin, 19.30',
              tempat: 'Kediaman Gus Hafidz',
            ),
            RutinanItem(
              title: 'Kajian Talim Mutaalim',
              waktu: 'Rabu, 19.30',
              tempat: 'Kediaman Gus Hafidz',
            ),
            RutinanItem(
              title: 'Latihan Pagar Nusa',
              waktu: 'Kamis, 21.00',
              tempat: 'Halaman Musholla Nurul Huda',
            ),
            RutinanItem(
              title: 'Kajian Fiqih',
              waktu: 'Senin, 19.30',
              tempat: 'Kediaman Gus Hafidz',
            ),
            RutinanItem(
              title: 'Kajian Talim Mutaalim',
              waktu: 'Rabu, 19.30',
              tempat: 'Kediaman Gus Hafidz',
            ),
            RutinanItem(
              title: 'Latihan Pagar Nusa',
              waktu: 'Kamis, 21.00',
              tempat: 'Halaman Musholla Nurul Huda',
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            contentRutinan(),
          ],
        ),
      ),
    );
  }
}
