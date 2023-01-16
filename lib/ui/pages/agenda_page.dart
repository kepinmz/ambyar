import 'package:ambyar_app/ui/pages/choose_seat_page.dart';
import 'package:ambyar_app/ui/widgets/custom_button.dart';
import 'package:ambyar_app/ui/widgets/detail_agenda_item.dart';
import 'package:ambyar_app/ui/widgets/visi_misi_item.dart';
import 'package:flutter/material.dart';
import 'package:ambyar_app/ui/widgets/agenda_card.dart';
import '../../shared/theme.dart';

class AgendaPage extends StatelessWidget {
  const AgendaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Text(
          'Agenda',
          style: whiteTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semibold,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget agendadetails() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kInactiveColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(18), // ini untuk ngerubah bentuk gambar
                    image: DecorationImage(
                      //fit: BoxFit.cover, //ini untuk ngepasin ke cover
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
                      'Festival Maulid',
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      'Rabu, 26 Januari 2023',
                      style: whiteTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                'Sehubungan dengan akan di selenggarakan MTQ XXII Tingkat kota Tangerang tahun 2023, dengan ini kami mengundang Bapak/Ibu/Saudara/Saudari untuk hadir pada acara Pembukaan kegiatan tersebut, yang akan dilaksanakan pada :',
                style: whiteTextStyle,
              ),
            ),
            DetailAgendaItem(
              title: 'Hari / Tanggal : ',
              detail: 'Sabtu, 14 Januari 2023',
              imageUrl: 'assets/icon_agenda.png',
            ),
            DetailAgendaItem(
              title: 'Waktu : ',
              detail: 'Pukul 19.00 WIB s/d selesai',
              imageUrl: 'assets/icon_rutinan.png',
            ),
            DetailAgendaItem(
              title: 'Tempat : ',
              detail: 'Jl. Satria Sudirman , \nSukaasih, Tangerang',
              imageUrl: 'assets/icon_location.png',
            ),
          ],
        ),
      );
    }

    Widget kehadiran() {
      return CustomButton(
        title: 'Ya, Saya akan Hadir',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChooseSeatPage(),
            ),
          );
        },
        margin: EdgeInsets.only(
          top: 30,
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
          title(),
          agendadetails(),
          kehadiran(),
        ],
      ),
    );
  }
}
