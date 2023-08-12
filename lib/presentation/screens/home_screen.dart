import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
              title: const Text('Cubit'),
              subtitle: const Text('Cubit example'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => context.push('/cubits')),
          ListTile(
              title: const Text('BLoC'),
              subtitle: const Text('BLoC composite state manager example'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => context.push('/bloc'))
        ],
      ),
    );
  }
}
