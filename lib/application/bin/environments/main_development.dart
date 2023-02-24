import 'package:flutter_clean_architecture_template/application/bin/bootstrap_app.dart';
import 'package:flutter_clean_architecture_template/domain/core/constants/enums.dart';

Future<void> main() async {
  await bootstrapApp(appContext: AppContext.development);
}
