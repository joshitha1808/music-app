import 'dart:io';

import 'package:client/core/theme/app_pallete.dart';
import 'package:client/core/utils.dart';
import 'package:client/core/widgets/custom_field.dart';
import 'package:client/features/home/view/widgets/audio_wave.dart';
import 'package:client/features/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class UploadSongsPage extends ConsumerStatefulWidget {
  const UploadSongsPage({super.key});

  @override
  ConsumerState<UploadSongsPage> createState() => _UploadSongsPageState();
}

class _UploadSongsPageState extends ConsumerState<UploadSongsPage> {
  final songNameController = TextEditingController();
  final artistController = TextEditingController();
  Color selectedColor = Pallete.cardColor;
  File? selectedImage;
  File? selectedAudio;
  final formKey = GlobalKey();

  void selectAudio() async {
    final pickedAudio = await pickAudio();
    if (pickedAudio != null) {
      setState(() {
        selectedAudio = pickedAudio;
      });
    }
  }

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    songNameController.dispose();
    artistController.dispose();
    super.dispose();
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
        actions: [
          IconButton(
            onPressed: () async {
              ref
                  .read(homeViewmodelProvider.notifier)
                  .UploadSongs(
                    selectedAudio: selectedAudio!,
                    selectedThumbnail: selectedImage!,
                    songName: songNameController.text,
                    artist: artistController.text,
                    selectedColor: selectedColor,
                  );
            },

            icon: Icon(Icons.check, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: selectImage,
                  child: selectedImage != null
                      ? SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : DottedBorder(
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
                                Icon(
                                  Icons.folder_open,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Select the thumbnail for your song',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 40),
                selectedAudio != null
                    ? AudioWave(path: selectedAudio!.path)
                    : CustomField(
                        hintText: 'Pick Song',
                        controller: null,
                        readOnly: true,
                        autofocus: false,
                        onTap: selectAudio,
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
                SizedBox(height: 20),
                ColorPicker(
                  pickersEnabled: const {ColorPickerType.wheel: true},
                  color: selectedColor,
                  onColorChanged: (Color color) {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
