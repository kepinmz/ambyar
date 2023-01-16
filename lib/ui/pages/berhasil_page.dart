// ignore_for_file: prefer_const_constructors

import 'package:ambyar_app/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:ambyar_app/ui/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class BerhasilPage extends StatelessWidget {
  const BerhasilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget berhasilCard() {
      return Container(
        width: 230,
        height: 230,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/jempol2.png'),
            ),
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withOpacity(0.8),
                blurRadius: 75,
                offset: Offset(0, 10),
              ),
            ]),
      );
    }

    Widget title() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                state.user.name,
                style: whiteTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: bold,
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget subtitle() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          'Selamat anda berhasil mendaftar',
          style: whiteTextStyle.copyWith(
            fontSize: 20,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget startButton() {
      return CustomButton(
        title: 'MULAI',
        width: 350,
        margin: EdgeInsets.only(
          top: 50,
        ),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            berhasilCard(),
            title(),
            subtitle(),
            startButton(),
          ],
        ),
      ),
    );
  }
}
