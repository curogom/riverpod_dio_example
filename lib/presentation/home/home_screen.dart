import 'package:flutter/material.dart';
import 'package:riverpod_dio_example/presentation/home/home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const HomeView(),
    );
  }
}
