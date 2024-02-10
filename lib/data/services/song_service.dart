import 'package:cdn/models/song_model.dart';

abstract class SongService {
  Future<List<SongModel>> getAllSongs();
}
