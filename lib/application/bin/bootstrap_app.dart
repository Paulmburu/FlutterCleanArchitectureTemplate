import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/application/bin/app/app_lifecycle_manager.dart';
import 'package:flutter_clean_architecture_template/domain/core/constants/enums.dart';
import 'package:flutter_clean_architecture_template/domain/endpoints/endpoint_contexts.dart';
import 'package:flutter_clean_architecture_template/presentation/pages/my_app.dart';

Future<void> bootstrapApp({
  AppContext? appContext = AppContext.development,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize the endpoint context
  EndpointContext.init(currentContext: appContext);

  runApp(
    AppLifecycleManager(
      child: MyApp(
        appContext: appContext,
      ),
    ),
  );
}
