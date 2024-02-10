import 'package:cdn/models/server_model.dart';

abstract class ServerService {
  Future<List<ServerModel>> getAllServers();
}
