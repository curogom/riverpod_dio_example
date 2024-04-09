import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dio_example/presentation/detail/detail_screen.dart';
import 'package:riverpod_dio_example/presentation/home/home_provider.dart';
import 'package:riverpod_dio_example/util/logger.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(homeScreenProvider);

    if (data.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (data.hasError) {
      logger.e(data.error, stackTrace: data.stackTrace);
      return const Center(child: Text('Error'));
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        final value = data.value ?? [];
        final id = int.tryParse(value[index].id) ?? 0;

        return ListTile(
          title: Text(value[index].name),
          subtitle: Text(value[index].id),
          onTap: () async {
            if (id == 0) {
              return;
            }

            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DetailScreen(id: id)),
            );
          },
        );
      },
      itemCount: data.value?.length ?? 0,
    );
  }
}
