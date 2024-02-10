import 'package:cdn/models/song_model.dart';
import 'package:cdn/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SongTile extends StatelessWidget {
  final SongModel songModel;
  final Function()? onTap;

  const SongTile({super.key, required this.songModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            color: surface, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            onTap: onTap,
            leading: Hero(
              tag: songModel.title,
              child: const CircleAvatar(
                child: Icon(
                  FontAwesomeIcons.music,
                  color: Colors.black54,
                ),
              ),
            ),
            title: Text(songModel.title),
            subtitle: Text(songModel.artist),
            trailing: Text(
              songModel.type,
              style: const TextStyle(color: Colors.green, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }
}
