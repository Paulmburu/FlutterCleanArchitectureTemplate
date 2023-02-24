import 'package:flutter_clean_architecture_template/application/services/env.dart';
import 'package:flutter_clean_architecture_template/domain/core/constants/enums.dart';

class EndpointContext {
  final AppContext _appContext;
  static EndpointContext? _instance;

  EndpointContext._(this._appContext);

  static EndpointContext get instance => init();

  static EndpointContext init({
    AppContext? currentContext,
  }) {
    return _instance ??=
        EndpointContext._(currentContext ?? AppContext.development);
  }

  // define all other methods that return specific endpoints as static functions
  //base api
  String baseEndpoint() {
    switch (_appContext) {
      case AppContext.production:
        return Env.prodEndpoint;
      case AppContext.staging:
        return Env.uatEndpoint;
      default:
        return Env.devEndpoint;
    }
  }
}
