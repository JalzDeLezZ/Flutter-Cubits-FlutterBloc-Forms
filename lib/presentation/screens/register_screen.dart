// ignore_for_file: avoid_print

import 'package:fbloc_cubits_forms/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: const _RegisterView(),
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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _username = '';
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          CustomTextFormFiel(
            label: 'Username',
            onChanged: (value) => _username = value,
            validator: (value) {
              if (value == null || value.trim().isEmpty || value.isEmpty) {
                return 'Username is required';
              } else if (value.length < 6) {
                return 'Username must be at least 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormFiel(
            label: 'Email',
            onChanged: (value) => _email = value,
            validator: (value) {
              if (value == null || value.trim().isEmpty || value.isEmpty) {
                return 'Username is required';
              }
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if (!emailRegExp.hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormFiel(
            label: 'Password',
            obscureText: true,
            onChanged: (value) => _password = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Username is required';
              } else if (value.length < 6) {
                return 'Username must be at least 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;

              print('Username: $_username');
              print('Email: $_email');
              print('Password: $_password');
            },
            icon: const Icon(Icons.save),
            label: const Text('Create Account'),
          )
        ]));
  }
}
