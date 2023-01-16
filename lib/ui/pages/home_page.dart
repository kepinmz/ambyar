// ignore_for_file: unused_import

import 'package:ambyar_app/cubit/agenda_cubit.dart';
import 'package:ambyar_app/cubit/auth_cubit.dart';
import 'package:ambyar_app/cubit/kegiatan_cubit.dart';
import 'package:ambyar_app/models/agenda_model.dart';
import 'package:ambyar_app/models/kegiatan_model.dart';
import 'package:ambyar_app/ui/widgets/agenda_card.dart';
import 'package:ambyar_app/ui/widgets/custom_button.dart';
import 'package:ambyar_app/ui/widgets/kegiatan_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';
import '../widgets/bottom_navigation_item.dart';
import '../widgets/menu_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<KegiatanCubit>().fetchKegiatans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 25,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${state.user.name}',
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Coba',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/pas_foto.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget kegiatanTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 50,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kegiatan Baru-Baru Ini',
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
      );
    }

    Widget kegiatanBaru(List<KegiatanModel> kegiatans) {
      return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: kegiatans.map((KegiatanModel kegiatan) {
              return KegiatanCard(kegiatan);
            }).toList(),
          ),
        ),
      );
    }

    Widget agenda(List<KegiatanModel> kegiatans) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 120,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Agenda Mendatang',
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semibold,
              ),
            ),
            Column(
              children: kegiatans.map((KegiatanModel kegiatan) {
                return AgendaCard(kegiatan);
              }).toList(),
            ),
          ],
        ),
      );
    }

    /*  Widget menuBarTop() {
      return Container(
        margin: EdgeInsets.only(top: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MenuButton(imageUrl: 'assets/agenda_btn.png'),
            MenuButton(imageUrl: 'assets/kegiatan_btn.png'),
            MenuButton(imageUrl: 'assets/tokoh_btn.png'),
          ],
        ),
      );
    }

    Widget menuBarBottom() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MenuButton(imageUrl: 'assets/artikel_btn.png'),
            MenuButton(imageUrl: 'assets/rutinan_btn.png'),
            MenuButton(imageUrl: 'assets/organisasi_btn.png'),
          ],
        ),
      );
    }
*/
    return BlocConsumer<KegiatanCubit, KegiatanState>(
      listener: (context, state) {
        if (state is KegiatanFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is KegiatanSuccess) {
          return ListView(
            children: [
              header(),
              kegiatanTitle(),
              kegiatanBaru(state.kegiatans),
              agenda(state.kegiatans),
              //menuBarTop(),
              //menuBarBottom(),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
