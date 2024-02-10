import 'package:cdn/data/data_provider.dart';
import 'package:cdn/features/server/widgets/server_tile.dart';
import 'package:cdn/models/server_model.dart';
import 'package:cdn/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServerScreen extends ConsumerWidget {
  const ServerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () async {
          return ref.refresh(serverDataProvider);
        },
        child: const Icon(FontAwesomeIcons.refresh, color: surface),
      ),
      body: ref.watch(serverDataProvider).when(
            data: (data) {
              List<ServerModel> servers = data;
              return Column(
                children: [
                  const SizedBox(height: 32),
                  Expanded(
                    child: ListView.builder(
                      itemCount: servers.length,
                      itemBuilder: (_, index) {
                        return ServerTile(
                          serverModel: servers[index],
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
