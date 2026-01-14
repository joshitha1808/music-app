import 'package:client/core/widgets/loader.dart';
import 'package:client/features/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SongsPage extends ConsumerWidget {
  const SongsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Latest today',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
            ),
          ),
          ref
              .watch(getAllSongsProvider)
              .when(
                data: (songs) {
                  print(songs);
                  return Text('Hello');
                },
                error: (error, st) {
                  return Center(child: Text(error.toString()));
                },
                loading: () => const Loader(),
              ),
        ],
      ),
    );
  }
}
