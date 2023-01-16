// ignore_for_file: prefer_const_constructors

import 'package:ambyar_app/cubit/auth_cubit.dart';
import 'package:ambyar_app/cubit/kegiatan_cubit.dart';
import 'package:ambyar_app/cubit/page_cubit.dart';
import 'package:ambyar_app/ui/pages/berhasil_page.dart';
import 'package:ambyar_app/ui/pages/get_started_page.dart';
import 'package:ambyar_app/ui/pages/main_page.dart';
import 'package:ambyar_app/ui/pages/rutinan_page.dart';
import 'package:ambyar_app/ui/pages/sign_in_page.dart';
import 'package:ambyar_app/ui/pages/sign_up_page.dart';
import 'package:ambyar_app/ui/pages/splash_page.dart';
import 'package:ambyar_app/ui/pages/tokoh_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => KegiatanCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/berhasil': (context) => BerhasilPage(),
          '/main': (context) => MainPage(),
          '/tokoh': (context) => TokohPage(),
        },
      ),
    );
  }
}
