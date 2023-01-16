// ignore_for_file: prefer_const_constructors

import 'package:ambyar_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget AnsorLogo() {
      return Container(
        width: 230,
        height: 230,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/ansor.png'),
          ),
        ),
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Text(
          'Selamat Datang di',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: regular,
          ),
        ),
      );
    }

    Widget subtitle() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          'AMBYAR',
          style: whiteTextStyle.copyWith(
            fontSize: 32,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          '(Ansor Mandiri Berkarya & Religius)',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: regular,
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
          Navigator.pushNamed(context, '/sign-up');
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnsorLogo(),
            title(),
            subtitle(),
            description(),
            startButton(),
          ],
        ),
      ),
    );
  }
}
