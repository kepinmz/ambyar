import 'package:ambyar_app/cubit/auth_cubit.dart';
import 'package:ambyar_app/ui/widgets/custom_button.dart';
import 'package:ambyar_app/ui/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';
import '../widgets/custom_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController rantingController =
      TextEditingController(text: '');
  final TextEditingController hpController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Text(
          'Daftar dan dapatkan info menarik seputar kegiatan Ansor di Jatiuwung',
          style: whiteTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semibold,
          ),
          textAlign: TextAlign.left,
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return CustomTextFormField(
          hintText: 'Masukan nama lengkap',
          controller: nameController,
        );
      }

      Widget emailInput() {
        return CustomTextFormField(
          hintText: 'Masukan alamat email',
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          hintText: 'Masukan password',
          controller: passwordController,
          obscureText: true,
        );
      }

      //RANGTING
      Widget rantingInput() {
        return CustomDropdown(
          controller: rantingController,
        );
      }

      Widget hapeInput() {
        return CustomTextFormField(
          keyboardType: TextInputType.phone,
          hintText: 'Masukan nomor handphone',
          controller: hpController,
        );
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/berhasil', (route) => false);
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
              title: 'RESGISTRASI',
              width: 350,
              margin: EdgeInsets.only(
                top: 40,
                bottom: 15,
              ),
              onPressed: () {
                context.read<AuthCubit>().signUp(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text,
                    ranting: rantingController.text,
                    hp: hpController.text);
              },
            );
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 40),
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
            nameInput(),
            emailInput(),
            passwordInput(),
            rantingInput(),
            hapeInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget tacButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-in');
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 30,
          ),
          child: Text(
            'Sudah punya akun? Masuk disini',
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
            title(),
            inputSection(),
            tacButton(),
          ],
        ),
      ),
    );
  }
}
