import 'package:client/core/providers/current_song_notifier.dart';
import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/home/models/song_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicPlayer extends ConsumerWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CurrentSong = ref.watch(currentSongNotifierProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(CurrentSong!.thumbnail_url),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            CurrentSong.song_name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Pallete.whiteColor,
                            ),
                          ),
                          Text(
                            CurrentSong.artist,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Pallete.subtitleText,
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: const SizedBox()),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.heart),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Pallete.whiteColor,
                    inactiveTickMarkColor: Pallete.whiteColor.withOpacity(
                      0.117,
                    ),
                    thumbColor: Pallete.whiteColor,
                    trackHeight: 4,
                    overlayShape: SliderComponentShape.noOverlay,
                  ),
                  child: Slider(value: 0.5, onChanged: (val) {}),
                ),
              ],
            ),
            const Row(
              children: [
                Text(
                  '0.05',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Pallete.subtitleText,
                  ),
                ),
                Expanded(child: SizedBox()),
                Text(
                  '0.15',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Pallete.subtitleText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assests/icons/suffle.png',
                    color: Pallete.whiteColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assests/icons/previous-song.png',
                    color: Pallete.whiteColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.play_circle_fill),
                  iconSize: 80,
                  color: Pallete.whiteColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assests/icons/next-song.png',
                    color: Pallete.whiteColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assests/icons/repeat.png',
                    color: Pallete.whiteColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assests/icons/connect-device.png',
                    color: Pallete.whiteColor,
                  ),
                ),
                Expanded(child: const SizedBox()),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assests/icons/playlist.png',
                    color: Pallete.whiteColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
