import 'package:client/core/providers/current_song_notifier.dart';
import 'package:client/core/providers/current_user_notifier.dart';
import 'package:client/core/theme/app_pallete.dart';
import 'package:client/core/utils.dart';
import 'package:client/features/home/view/widgets/music_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicSlab extends ConsumerWidget {
  const MusicSlab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSong = ref.watch(currentSongNotifierProvider);
    final songNotifier = ref.read(currentSongNotifierProvider.notifier);
    final userFavorites = ref.watch(
      currentUserNotifierProvider.select((data) => data!.favorites),
    );

    if (currentSong == null) {
      return const SizedBox();
    }

    final slabWidth = MediaQuery.of(context).size.width - 16;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (_, animation, __) => const MusicPlayer(),
            transitionsBuilder: (_, animation, __, child) {
              final offsetAnimation = animation.drive(
                Tween(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeIn)),
              );
              return SlideTransition(position: offsetAnimation, child: child);
            },
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 66,
              width: slabWidth,
              padding: const EdgeInsets.all(9),
              color: hexToColor(currentSong.hex_code),
              child: Row(
                children: [
                  Hero(
                    tag: 'music-image',
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: NetworkImage(currentSong.thumbnail_url),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          currentSong.song_name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          currentSong.artist,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Pallete.subtitleText,
                          ),
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      userFavorites
                              .where((fav) => fav.song_id == currentSong.id)
                              .toList()
                              .isNotEmpty
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                    ),
                    color: Colors.red,
                  ),

                  IconButton(
                    onPressed: songNotifier.playPause,
                    icon: Icon(
                      songNotifier.isPlaying
                          ? CupertinoIcons.pause_fill
                          : CupertinoIcons.play_fill,
                    ),
                    color: Colors.black,
                  ),
                ],
              ),
            ),

            // INACTIVE SEEK BAR
            Positioned(
              bottom: 0,
              left: 8,
              child: Container(
                width: slabWidth - 16,
                height: 2,
                decoration: BoxDecoration(
                  color: Pallete.inactiveSeekColor,
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),

            // ACTIVE SEEK BAR
            StreamBuilder(
              stream: songNotifier.audioPlayer?.positionStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData ||
                    songNotifier.audioPlayer?.duration == null) {
                  return const SizedBox();
                }

                final position = snapshot.data!;
                final duration = songNotifier.audioPlayer!.duration!;
                final progress =
                    position.inMilliseconds / duration.inMilliseconds;

                return Positioned(
                  bottom: 0,
                  left: 8,
                  child: Container(
                    height: 2,
                    width: progress * (slabWidth - 16),
                    decoration: BoxDecoration(
                      color: Pallete.whiteColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
