import 'dart:convert';

import 'package:cdn/data/services/server_service.dart';
import 'package:cdn/models/server_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class ServerServiceImpl extends ServerService {
  final String _endpoint = "http://localhost:8080/api/v1/servers";

  @override
  Future<List<ServerModel>> getAllServers() async {
    await Future.delayed(const Duration(seconds: 5));
    Response response = await get(Uri.parse(_endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)["data"];
      return result.map((e) => ServerModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final serverServiceProvider =
    Provider<ServerService>((ref) => ServerServiceImpl());
