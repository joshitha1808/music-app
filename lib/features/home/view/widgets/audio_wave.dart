import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioWave extends StatefulWidget {
  final String path;

  const AudioWave({super.key, required this.path});

  @override
  State<AudioWave> createState() => _AudioWaveState();
}

class _AudioWaveState extends State<AudioWave> {
  final PlayerController playerController = PlayerController();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    initAudioPlayer();

    playerController.onPlayerStateChanged.listen((state) async {
      if (state == PlayerState.playing) {
        isPlaying = true;
      } else {
        isPlaying = false;
      }

      if (state == PlayerState.stopped) {
        await playerController.preparePlayer(
          path: widget.path,
          shouldExtractWaveform: true,
        );
        await playerController.seekTo(0);
      }

      if (mounted) setState(() {});
    });
  }

  Future<void> initAudioPlayer() async {
    await playerController.preparePlayer(
      path: widget.path,
      shouldExtractWaveform: true,
    );
  }

  Future<void> playAndPause() async {
    if (isPlaying) {
      await playerController.pausePlayer();
    } else {
      await playerController.startPlayer();
    }
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: playAndPause,
          icon: Icon(
            isPlaying
                ? CupertinoIcons.pause_solid
                : CupertinoIcons.play_arrow_solid,
          ),
        ),
        Expanded(
          child: AudioFileWaveforms(
            size: const Size(double.infinity, 100),
            playerController: playerController,
          ),
        ),
      ],
    );
  }
}
