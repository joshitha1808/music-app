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
  bool isCompleted = false;
  int currentPosition = 0;

  @override
  void initState() {
    super.initState();
    initAudioPlayer();

    playerController.onCurrentDurationChanged.listen((duration) {
      currentPosition = duration;
    });

    playerController.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.playing) {
        isPlaying = true;
        isCompleted = false;
      } else if (state == PlayerState.stopped) {
        isPlaying = false;
        isCompleted = true;
      } else {
        isPlaying = false;
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
      return;
    }

    if (isCompleted) {
      await playerController.preparePlayer(
        path: widget.path,
        shouldExtractWaveform: false,
      );
      await playerController.seekTo(currentPosition);
      isCompleted = false;
    }

    await playerController.startPlayer();
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
