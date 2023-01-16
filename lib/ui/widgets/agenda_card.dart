import 'package:ambyar_app/models/agenda_model.dart';
import 'package:ambyar_app/models/kegiatan_model.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import '../pages/agenda_page.dart';

class AgendaCard extends StatelessWidget {
  final KegiatanModel kegiatan;
  const AgendaCard(
    this.kegiatan, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AgendaPage(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
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
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/icon_agenda.png',
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kegiatan.title,
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  kegiatan.tanggal,
                  style: whiteTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
