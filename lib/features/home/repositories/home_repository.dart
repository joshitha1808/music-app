import 'Package:http/http.dart' as http;
import 'package:client/core/server_constants.dart';

class HomeRepository {
  Future<void> uploadSong() async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${ServerConstant.serverURL}/song/upload'),
    );
    request
      ..files.addAll([
        await http.MultipartFile.fromPath('song', '/Users/'),
        await http.MultipartFile.fromPath('thumbnail', '/Users/'),
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
  }
}
