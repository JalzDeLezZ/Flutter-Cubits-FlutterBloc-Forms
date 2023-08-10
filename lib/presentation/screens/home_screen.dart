import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
            title: const Text('Cubit'),
            subtitle: const Text('Cubit example'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {} //Navigator.pushNamed(context, '/cubit'),
            )
      ],
    );
  }
}
