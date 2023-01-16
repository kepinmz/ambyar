import 'package:ambyar_app/cubit/auth_cubit.dart';
import 'package:ambyar_app/ui/widgets/custom_button.dart';
import 'package:ambyar_app/ui/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';
import '../widgets/custom_text_form_field.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ansor.png'),
              ),
            ),
          ),
        ]),
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Text(
          'Masuk kedalam akun \nyang sudah ada',
          style: whiteTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semibold,
          ),
          textAlign: TextAlign.left,
        ),
      );
    }

    Widget inputSection() {
      Widget emailInput() {
        return CustomTextFormField(
          hintText: 'Masukan alamat email',
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          hintText: 'masukan password',
          controller: passwordController,
          obscureText: true,
        );
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomButton(
              title: 'MASUK',
              width: 350,
              margin: EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              onPressed: () {
                context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
            );
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 25),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: kInactiveColor,
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget tacButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-up');
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 50,
          ),
          child: Text(
            'Belum punya akun? Daftar disini',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            logo(),
            title(),
            inputSection(),
            tacButton(),
          ],
        ),
      ),
    );
  }
}
