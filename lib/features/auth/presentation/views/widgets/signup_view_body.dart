import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/utils/terms_conditions.dart';
import 'package:bookly/features/auth/presentation/manger/register_cubit/register_cubit.dart';
import 'package:bookly/features/auth/presentation/views/widgets/Custom_auth_textfield.dart';
import 'package:bookly/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:bookly/features/auth/presentation/views/widgets/custom_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegistarFailure) {
          CustomSnackBar.show(context, state.errMessage);
        } else if (state is RegistarSuccess) {
          CustomSnackBar.show(context, "Registration Successful");
          GoRouter.of(context).push(AppRouter.homeView);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegistarLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Center(
                    child: Image.asset(
                      AssetsData.logo,
                      width: 200,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Create New Account",
                    textAlign: TextAlign.center,
                    style: Styles.textStyle30,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'Full Name',
                    hintText: 'Full Name',
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Full Name is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'Email',
                    hintText: 'Email',
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    isPassword: true,
                    labelText: 'Password',
                    hintText: 'Password',
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TermsConditions(
                    onChanged: (value) => setState(() => isAccepted = value),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: "Sign Up",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        if (isAccepted) {
                          BlocProvider.of<RegisterCubit>(context)
                              .signUpWithGmail(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            nameController.text.trim(),
                            "123456789",
                          );
                        } else {
                          CustomSnackBar.show(context,
                              "You must accept the terms and conditions");
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Already have an account?  Login",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF6C63FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
