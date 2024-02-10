import 'package:cdn/data/services/server_service_impl.dart';
import 'package:cdn/data/services/song_service_impl.dart';
import 'package:cdn/models/server_model.dart';
import 'package:cdn/models/song_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serverDataProvider = FutureProvider<List<ServerModel>>((ref) async {
  return ref.watch(serverServiceProvider).getAllServers();
});

final songDataProvider = FutureProvider<List<SongModel>>((ref) async {
  return ref.watch(songServiceProvider).getAllSongs();
});
