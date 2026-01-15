import 'package:client/core/providers/current_song_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicSlab extends ConsumerWidget {
  const MusicSlab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CurrentSong = ref.watch(currentSongNotifierProvider);

    if (CurrentSong == null) {
      return const SizedBox();
    }

    return Container();
  }
}
