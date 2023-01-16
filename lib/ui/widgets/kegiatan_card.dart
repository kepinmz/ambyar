import 'package:ambyar_app/models/kegiatan_model.dart';
import 'package:ambyar_app/ui/pages/kegiatan_page.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class KegiatanCard extends StatelessWidget {
  final KegiatanModel kegiatan;
  const KegiatanCard(
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
            builder: (context) => KegiatanPage(kegiatan),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          children: [
            Container(
              width: 363,
              height: 280,
              margin: EdgeInsets.only(
                left: defaultMargin,
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: kInactiveColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          kegiatan.imageUrl,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text(
                          kegiatan.title,
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text(
                          kegiatan.tanggal,
                          style: whiteTextStyle.copyWith(
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
