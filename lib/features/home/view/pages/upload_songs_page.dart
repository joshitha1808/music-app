import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dotted_border/dotted_border.dart';

class UploadSongsPage extends ConsumerStatefulWidget {
  const UploadSongsPage({super.key});

  @override
  ConsumerState<UploadSongsPage> createState() => _UploadSongsPageState();
}

class _UploadSongsPageState extends ConsumerState<UploadSongsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,

        title: Center(
          child: const Text(
            'Upload Songs',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          DottedBorder(
            child: SizedBox(
              child: Column(
                children: [
                  Icon(Icons.folder_open, size: 40, color: Colors.white),
                  Text(
                    'Select the thumbnail for your song',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
