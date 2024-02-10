import 'package:cdn/features/server/screen/server_screen.dart';
import 'package:cdn/index_navigation_provider.dart';
import 'package:cdn/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'features/song/screen/song_screen.dart';

class Index extends ConsumerWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: surface,
        centerTitle: true,
        title: const Text(
          "Mangement Content Distribution Network (CDN)",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Row(
        children: [
          NavigationRail(
            elevation: 5,
            extended: false,
            useIndicator: true,
            backgroundColor: surface,
            selectedLabelTextStyle: const TextStyle(
              color: primary,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: 'Helvetica',
            ),
            unselectedLabelTextStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 15,
              fontFamily: 'Helvetica',
            ),
            destinations: const [
              NavigationRailDestination(
                indicatorColor: primary,
                icon: Icon(FontAwesomeIcons.server),
                label: Text("Serveurs"),
              ),
              NavigationRailDestination(
                indicatorColor: primary,
                icon: Icon(FontAwesomeIcons.music),
                label: Text("Musiques"),
              ),
            ],
            selectedIndex: ref.watch(indexNavigationProvider),
            onDestinationSelected: (page) {
              ref.read(indexNavigationProvider.notifier).navigate(page);
            },
          ),
          Expanded(
              child: const [
            ServerScreen(),
            SongScreen()
          ][ref.watch(indexNavigationProvider)])
        ],
      ),
    );
  }
}
