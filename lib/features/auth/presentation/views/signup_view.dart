import 'package:bookly/features/auth/presentation/manger/register_cubit/register_cubit.dart';
import 'package:bookly/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static String id = 'SignUpView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        // appBar: AppBar(
        //     automaticallyImplyLeading: false,
        //     title: const Customappbar(
        //       text: 'حساب جديد',
        //     )),
        body: const SignupViewBody(),
      ),
    );
  }
}
