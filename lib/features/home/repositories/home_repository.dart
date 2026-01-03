import 'dart:io';

import 'Package:http/http.dart' as http;
import 'package:client/core/server_constants.dart';

class HomeRepository {
  Future<void> uploadSong(File selectedImage, File selectedAudio) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${ServerConstant.serverURL}/song/upload'),
    );
    request
      ..files.addAll([
        await http.MultipartFile.fromPath('song', selectedAudio.path),
        await http.MultipartFile.fromPath(
          'thumbnail',
          'file:///C:/Users/veera/Downloads/lonely-elephant-against-sunset-beautiful-sun-clouds-savannah-serengeti-national-park-africa-tanzania-artistic-imag-image-106950644.webp',
        ),
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
    print(res);
  }
}
