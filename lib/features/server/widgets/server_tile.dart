import 'package:cdn/models/server_model.dart';
import 'package:cdn/utils/color.dart';
import 'package:flutter/material.dart';

class ServerTile extends StatelessWidget {
  final ServerModel serverModel;
  final Function()? onTap;

  const ServerTile({super.key, required this.serverModel, this.onTap});

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
              tag: serverModel.name,
              child: const Image(
                image: AssetImage("assets/images/server.png"),
              ),
            ),
            title: Text(serverModel.name),
            subtitle: Text(serverModel.address),
            trailing: serverModel.available
                ? const Text("Disponible",
                    style: TextStyle(color: Colors.green, fontSize: 13))
                : const Text("Indisponible",
                    style: TextStyle(color: Colors.red, fontSize: 13)),
          ),
        ),
      ),
    );
  }
}
