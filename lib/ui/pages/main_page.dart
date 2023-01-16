// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:ambyar_app/cubit/page_cubit.dart';
import 'package:ambyar_app/ui/pages/agenda_page.dart';
import 'package:ambyar_app/ui/pages/home_page.dart';
import 'package:ambyar_app/ui/pages/kegiatan_page.dart';
import 'package:ambyar_app/ui/pages/organisasi_page.dart';
import 'package:ambyar_app/ui/pages/rutinan_page.dart';
import 'package:ambyar_app/ui/pages/setting_page.dart';
import 'package:ambyar_app/ui/pages/tokoh_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';
import 'package:ambyar_app/ui//widgets/bottom_navigation_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return OrganisasiPage();
        case 2:
          return AgendaPage();
        case 3:
          return TokohPage();
        case 4:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // ignore: prefer_const_constructors
              BottomNavigationItem(
                index: 0,
                imageUrl: 'assets/home_btn.png',
              ),
              BottomNavigationItem(
                index: 1,
                imageUrl: 'assets/kegiatan_btn.png',
              ),
              BottomNavigationItem(
                index: 2,
                imageUrl: 'assets/rutinan_btn.png',
              ),
              BottomNavigationItem(
                index: 3,
                imageUrl: 'assets/tokoh_btn.png',
              ),
              BottomNavigationItem(
                index: 4,
                imageUrl: 'assets/organisasi_btn.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
