import 'package:flutter/material.dart';
import 'package:riverpod_dio_example/presentation/detail/detail_view.dart';

class DetailScreen extends StatelessWidget {
  final int id;

  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail $id Screen'),
      ),
      body: DetailView(id: id),
    );
  }
}

