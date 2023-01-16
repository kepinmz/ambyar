import 'package:ambyar_app/models/kegiatan_model.dart';
import 'package:ambyar_app/ui/pages/choose_seat_page.dart';
import 'package:ambyar_app/ui/widgets/custom_button.dart';
import 'package:ambyar_app/ui/widgets/photo_item.dart';
import 'package:ambyar_app/ui/widgets/gambar_kecil_item.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class KegiatanPage extends StatelessWidget {
  final KegiatanModel kegiatan;

  const KegiatanPage(this.kegiatan, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              kegiatan.imageUrl,
            ),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        height: 214,
        width: double.infinity,
        margin: EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              kBackgroundColor.withOpacity(0.95)
            ],
          ),
        ),
      );
    }

    Widget titleContent() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 306),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kegiatan.title,
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: bold,
                          ),
                        ),
                        Text(
                          kegiatan.tanggal,
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //TITLE

            Container(),

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: kInactiveColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kegiatan.isi,
                    style: whiteTextStyle.copyWith(
                      height: 2,
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  //button akhir
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            titleContent(),
          ],
        ),
      ),
    );
  }
}
