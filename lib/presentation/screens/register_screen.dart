// ignore_for_file: avoid_print

import 'package:fbloc_cubits_forms/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:fbloc_cubits_forms/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(children: [
          FlutterLogo(size: 200),
          _RegisterForm(),
          SizedBox(height: 20),
        ]),
      ),
    ));
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
        child: Column(children: [
          CustomTextFormFiel(
            label: 'Username',
            onChanged: registerCubit.usernameChanged,
            errorText: username.errorMessage,
          ),
          const SizedBox(height: 20),
          CustomTextFormFiel(
            label: 'Email',
            onChanged: registerCubit.emailChanged,
            errorText: email.errorMessage,
          ),
          const SizedBox(height: 20),
          CustomTextFormFiel(
            label: 'Password',
            obscureText: true,
            onChanged: registerCubit.passwordChanged,
            errorText: password.errorMessage,
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Create Account'),
          )
        ]));
  }
}
