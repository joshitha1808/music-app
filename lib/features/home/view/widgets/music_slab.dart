import 'package:client/core/providers/current_song_notifier.dart';
import 'package:client/core/theme/app_pallete.dart';
import 'package:client/core/utils.dart';
import 'package:flutter/cupertino.dart';
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

    return Container(
      height: 66,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: hexToColor(CurrentSong.hex_code)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 48,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(CurrentSong!.thumbnail_url),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              Text(
                CurrentSong.song_name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                CurrentSong.artist,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Pallete.subtitleText,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.heart),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.play_fill),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
