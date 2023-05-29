import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe/core/injector/injector.dart';
import 'package:recipe/src/presentation/bloc/auth_bloc.dart';
import 'package:recipe/src/presentation/styles/app_colors.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  late final AuthBloc authBloc;

  LoginPage({super.key}) {
    authBloc = services<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailEditingController = TextEditingController();
    final TextEditingController usernameEditingController = TextEditingController();
    final TextEditingController passwordEditingController = TextEditingController();

    void onSignupEvent() {
      authBloc.add(AuthEvent.signup(
        email: emailEditingController.text,
        username: usernameEditingController.text,
        password: passwordEditingController.text,
      ));
    }

    void onLoginEvent() {
      authBloc.add(AuthEvent.login(
        email: emailEditingController.text,
        password: passwordEditingController.text,
      ));
    }

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 240,
                      child: SvgPicture.asset('assets/svg/recipe-login.svg'),
                    ),
                    const Text(
                      'Recipe Service',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.homeTitleColor,
                      ),
                    ),
                    const Text(
                      'By mof mfua Students',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.homeTitleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                constraints: const BoxConstraints(
                  maxWidth: 320.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: onSignupEvent,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.leftLinear,
                              AppColors.rightLinear,
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    GestureDetector(
                      onTap: onLoginEvent,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
