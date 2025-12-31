import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadSongsPage extends ConsumerStatefulWidget {
  const UploadSongsPage({super.key});

  @override
  ConsumerState<UploadSongsPage> createState() => _UploadSongsPageState();
}

class _UploadSongsPageState extends ConsumerState<UploadSongsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Upload Songs')));
  }
}
