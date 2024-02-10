import 'dart:convert';

import 'package:cdn/data/services/song_service.dart';
import 'package:cdn/models/song_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class SongServiceImpl extends SongService {
  final String _endpoint = "http://localhost:8080/api/v1/songs";

  @override
  Future<List<SongModel>> getAllSongs() async {
    await Future.delayed(const Duration(seconds: 5));
    Response response = await get(Uri.parse(_endpoint));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)["data"];
      return result.map((e) => SongModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final songServiceProvider = Provider<SongService>((ref) => SongServiceImpl());
