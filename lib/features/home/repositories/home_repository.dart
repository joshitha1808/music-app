import 'dart:io';

import 'Package:http/http.dart' as http;
import 'package:client/core/server_constants.dart';
import 'package:client/core/theme/failure/failure.dart';
import 'package:fpdart/fpdart.dart';

class HomeRepository {
  Future<Either<AppFailure, String>> uploadSong(
    File selectedImage,
    File selectedAudio,
  ) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('${ServerConstant.serverURL}/song/upload'),
      );
      request
        ..files.addAll([
          await http.MultipartFile.fromPath('song', selectedAudio.path),
          await http.MultipartFile.fromPath('thumbnail', selectedImage.path),
        ])
        ..fields.addAll({
          'artist': 'Taylor',
          'song_name': 'Whoosh',
          'hex_code': 'FFFFFF',
        })
        ..headers.addAll({
          'x-auth-token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRiMjgzYjMyLWVjNWEtNGYxNy1iMmRlLTRkZDBmYjgwNjFhOSJ9.qIusTp49iEiX0z_1uGwYFjIAt7vAX-7KKKkRthRWyrg',
        });
      final res = await request.send();
      return Right(await res.stream.bytesToString());
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
