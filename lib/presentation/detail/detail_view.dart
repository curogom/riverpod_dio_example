import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dio_example/presentation/detail/detail_provider.dart';
import 'package:riverpod_dio_example/util/logger.dart';

class DetailView extends ConsumerWidget {
  final int id;

  const DetailView({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(detailScreenProvider(id));

    if (data.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (data.hasError) {
      logger.e(data.error, stackTrace: data.stackTrace);
      return const Center(child: Text('Error'));
    }

    final value = data.value!;

    return Center(
      child: Text(value.toString(), textAlign: TextAlign.center),
    );
  }
}
