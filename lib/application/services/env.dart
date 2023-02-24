import 'package:flutter_config/flutter_config.dart';

// ignore: avoid_classes_with_only_static_members
/// More environment variables can be added and accessed from here
class Env {
  static String devEndpoint =
      FlutterConfig.get('DEV_SERVER_URL').toString();
  static String uatEndpoint = FlutterConfig.get('UAT_SERVER_URL').toString();
  static String prodEndpoint =
      FlutterConfig.get('PRODUCTION_SERVER_URL').toString();
}
