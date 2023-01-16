// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:async';

import 'package:ambyar_app/cubit/auth_cubit.dart';
import 'package:ambyar_app/ui/pages/get_started_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/get-started', (route) => false);
      } else {
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/ansor.png',
                  ),
                ),
              ),
            ),
            Text(
              'PAC GP ANSOR JATIUWUNG',
              style: whiteTextStyle.copyWith(
                fontSize: 22,
                fontWeight: black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
