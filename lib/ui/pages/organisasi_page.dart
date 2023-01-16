import 'package:ambyar_app/ui/widgets/visi_misi_item.dart';
import 'package:flutter/material.dart';
import 'package:ambyar_app/ui/widgets/tokoh_item.dart';
import '../../shared/theme.dart';

class OrganisasiPage extends StatelessWidget {
  const OrganisasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(children: [
          Container(
            width: 234,
            height: 132,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/banner_organisasi.png'),
              ),
            ),
          ),
        ]),
      );
    }

    Widget about() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kInactiveColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //ABOUT
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                'Tentang Organisasi',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
            ),
            //ISI ABOUT
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Text(
                    'Gerakan Pemuda (GP) Ansor adalah organisasi \nkepemudaan, kemasyarakatan, kebangsaan, \ndan keagamaan yang berwatak kerakyatan. \nGerakan Pemuda Ansor atau disingkat GP Ansor \nadalah badan otonom di bawah \nNahdlatul Ulama (NU).',
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            // VISI
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                'Visi GP Ansor',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            VisiMisiItem(text: '1. Revitialisasi Nilai dan Tradisi'),
            VisiMisiItem(text: '2. Penguatan Sistem Kaderisasi'),
            VisiMisiItem(text: '3. Pemberdayaan Potensi Kader'),
            VisiMisiItem(text: '4. Kemandirian Organisasi'),
            // MISI

            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                'Misi GP Ansor',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            VisiMisiItem(
                text:
                    '1. Internalisasi Nilai ASWAJA dan Sifatur Rasul dalam Gerakan GP. Ansor.'),
            VisiMisiItem(
                text:
                    '2. Membangun Disiplin Organisasi dan Kadersasi bebasis Profesi.'),
            VisiMisiItem(
                text:
                    '3. Menjadi sentrum lalulintas informasi dan peluang usaha antar kader dengan stakeholder.'),
            VisiMisiItem(
                text:
                    '4. Mempercepat kemandirian ekonomi kader dan organisasi'),
          ],
        ),
      );
    }

    Widget titleStruktur() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //ABOUT
            Container(
              margin: EdgeInsets.only(),
              child: Text(
                'Kepengurusan',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget pengurus() {
      return TokohItem(
        title: 'Maftukhul Mujib',
        tempat: 'Ketua',
        imageUrl: 'assets/pas_foto.png',
      );
    }

    Widget space() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 140,
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          route(),
          about(),
          titleStruktur(),
          pengurus(),
          space(),
        ],
      ),
    );
  }
}
