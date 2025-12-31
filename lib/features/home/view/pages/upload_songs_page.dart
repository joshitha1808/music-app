import 'package:client/core/theme/app_pallete.dart';
import 'package:client/core/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dotted_border/dotted_border.dart';

class UploadSongsPage extends ConsumerStatefulWidget {
  const UploadSongsPage({super.key});

  @override
  ConsumerState<UploadSongsPage> createState() => _UploadSongsPageState();
}

class _UploadSongsPageState extends ConsumerState<UploadSongsPage> {
  final songNameController = TextEditingController();
  final artistController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    songNameController.dispose();
    artistController.dispose();
  }

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DottedBorder(
              color: Pallete.borderColor,
              dashPattern: const [10, 4],
              radius: const Radius.circular(10),
              borderType: BorderType.RRect,
              strokeCap: StrokeCap.round,

              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.folder_open, size: 40, color: Colors.white),
                    SizedBox(height: 15),
                    Text(
                      'Select the thumbnail for your song',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            CustomField(
              hintText: 'Pick Song',
              controller: null,
              readOnly: true,
              autofocus: false,
              onTap: () {},
            ),
            const SizedBox(height: 20),
            CustomField(
              hintText: 'Artist',
              controller: artistController,
              autofocus: false,
            ),
            SizedBox(height: 20),
            CustomField(
              hintText: 'Song Name',
              controller: songNameController,
              autofocus: false,
            ),
          ],
        ),
      ),
    );
  }
}
