import 'package:cdn/data/data_provider.dart';
import 'package:cdn/features/song/widgets/song_tile.dart';
import 'package:cdn/models/song_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/color.dart';

class SongScreen extends ConsumerWidget {
  const SongScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () async {
          return ref.refresh(songDataProvider);
        },
        child: const Icon(FontAwesomeIcons.refresh, color: surface),
      ),
      body: ref.watch(songDataProvider).when(
            data: (data) {
              List<SongModel> songs = data;
              return Column(
                children: [
                  const SizedBox(height: 32),
                  Expanded(
                    child: ListView.builder(
                      itemCount: songs.length,
                      itemBuilder: (_, index) {
                        return SongTile(
                          songModel: songs[index],
                          onTap: () {},
                        );
                      },
                    ),
                  )
                ],
              );
            },
            error: (err, s) => Center(
              child: Text(err.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
