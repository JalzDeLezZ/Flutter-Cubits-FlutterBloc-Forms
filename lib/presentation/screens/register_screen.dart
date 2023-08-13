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
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(children: [
          const FlutterLogo(size: 160),
          TextFormField(),
          TextFormField(),
          TextFormField(),
          TextFormField(),
          TextFormField(),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(Icons.save),
            label: const Text('Save User'),
          )
        ]),
      ),
    ));
  }
}
