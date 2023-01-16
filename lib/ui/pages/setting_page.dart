import 'package:ambyar_app/cubit/auth_cubit.dart';
import 'package:ambyar_app/cubit/page_cubit.dart';
import 'package:ambyar_app/ui/widgets/custom_button.dart';
import 'package:ambyar_app/ui/widgets/visi_misi_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ambyar_app/shared/theme.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
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
        margin: EdgeInsets.only(top: 20, bottom: 20),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kInactiveColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // VISI
            Container(
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
                top: 30,
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

    Widget signoutButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error),
              ),
            );
          } else if (state is AuthInitial) {
            context.read<PageCubit>().setPage(0);
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: CustomButton(
              title: 'Sign Out',
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
              width: 220,
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin,
        ),
        children: [
          header(),
          about(),
          signoutButton(),
        ],
      ),
    );
  }
}
