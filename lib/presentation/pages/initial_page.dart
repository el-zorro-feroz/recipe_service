import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/infrastucture/core/injector.dart';
import 'package:recipe/presentation/bloc/auth_bloc.dart';
import 'package:recipe/presentation/pages/app_page.dart';
import 'package:recipe/presentation/pages/login_page.dart';

@RoutePage()
class InitialPage extends StatelessWidget {
  late final AuthBloc authBloc;

  InitialPage({super.key}) {
    authBloc = getIt<AuthBloc>();
    authBloc.add(const AuthEvent.refresh());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        bloc: authBloc,
        builder: (context, state) {
          return state.map(
            initial: (state) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1.0,
                ),
              );
            },
            unauthorized: (state) {
              return LoginPage();
            },
            authorized: (state) {
              return AppPage();
            },
          );
        },
      ),
    );
  }
}