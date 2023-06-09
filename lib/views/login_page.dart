import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/view_models/authentication_viewmodel.dart';
import 'package:fit_flow_flutter/view_models/facebook_sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../view_models/google_sign_in_provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/full_screen_load_widget.dart';
import '../widgets/rounded_login_logo.dart';

/// The [LoginPage] class represents the login page in the FitFlow app.
///
/// This page allows users to log in by providing their email and password.
/// It includes input fields for email and password, as well as options for password recovery and social media login.
/// Users can tap on the "Log in" button to authenticate their credentials and access the app.
/// If they don't have an account, they can tap on the "Opret bruger" button to navigate to the signup page.
///
///authors: Jackie, Christoffer & Jakob
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: GetBuilder<AuthenticationViewModel>(
          builder: (viewModel) {
            return Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'assets/img/FitFlowLogo.png',
                          child: Image.asset(
                            'assets/img/FitFlowLogo.png',
                            width: 300,
                          ),
                        ),
                        CustomTextField(
                          label: "E-mail",
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                        ),
                        CustomTextField(
                          label: 'Kodeord',
                          controller: passwordController,
                          textInputType: TextInputType.visiblePassword,
                          isPassword: true,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed("/forgot");
                            },
                            child: Text(
                              'Glemt kodeord?',
                              style: TextStyle(
                                color: AppColors.lightGreyColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          text: 'Log in',
                          color: AppColors.yellowColor,
                          textColor: AppColors.darkGreyColor,
                          onTap: () {
                            viewModel.login(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          text: 'Opret bruger',
                          color: AppColors.darkGreyColor,
                          textColor: AppColors.yellowColor,
                          onTap: () {
                            Get.toNamed("/signup");
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundedLoginLogo(
                              imagePath: 'assets/icon/icon-google.png',
                              onTap: () {
                                final provider =
                                    Provider.of<GoogleSignInProvider>(context,
                                        listen: false);
                                provider.googleLogin();
                              },
                            ),
                            RoundedLoginLogo(
                              imagePath: 'assets/icon/icon-facebook.png',
                              onTap: () {
                                final provider =
                                    Provider.of<FacebookSignInProvider>(context,
                                        listen: false);
                                provider.signInWithFacebook();
                              },
                            ),
                            RoundedLoginLogo(
                              imagePath: 'assets/icon/icon-twitter.png',
                              onTap: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                if (viewModel.isLoading) FullScreenLoadWidget(),
              ],
            );
          },
        ));
  }
}
