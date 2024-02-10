import 'package:cdn/models/location_model.dart';

class ServerModel {
  final String id;
  final String name;
  final LocationModel location;
  final double latency;
  final double bandwidth;
  final String address;
  final bool available;

  ServerModel({
    required this.id,
    required this.name,
    required this.location,
    required this.latency,
    required this.bandwidth,
    required this.address,
    required this.available,
  });

  factory ServerModel.fromJson(Map<String, dynamic> json) {
    return ServerModel(
        id: json["id"],
        name: json["name"],
        location: LocationModel.fromJson(json["location"]),
        latency: json["latency"],
        bandwidth: json["bandwidth"],
        address: json["address"],
        available: json["available"]);
  }
}
