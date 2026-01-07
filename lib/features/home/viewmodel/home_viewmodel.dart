import 'dart:io';
import 'dart:ui';

import 'package:client/core/providers/current_user_notifier.dart';
import 'package:client/core/utils.dart';
import 'package:client/features/home/repositories/home_repository.dart';
import 'package:client/features/home/view/pages/upload_songs_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_viewmodel.g.dart';

@riverpod
class HomeViewmodel extends _$HomeViewmodel {
  late HomeRepository _homeRepository;
  @override
  AsyncValue? build() {
    _homeRepository = ref.watch(homeRepositoryProvider);
    return null;
  }

  Future<void> UploadSongs({
    required File selectedAudio,
    required File selectedThumbnail,
    required String songName,
    required String artist,
    required Color selectedColor,
  }) async {
    state = const AsyncValue.loading();
    final res = _homeRepository.uploadSong(
      selectedAudio: selectedAudio,
      selectedThumbnail: selectedThumbnail,
      songName: songName,
      artist: artist,
      hexCode: rgbToHex(selectedColor),
      token: ref.read(currentUserNotifierProvider)!.token,
    );
  }
}
