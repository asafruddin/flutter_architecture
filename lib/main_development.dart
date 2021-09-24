// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:try_starter/app/app.dart';
import 'package:try_starter/app/app_bloc_observer.dart';
import 'package:try_starter/core/di/injector_container.dart' as di;
import 'package:try_starter/env/config.dart';
import 'package:try_starter/env/flavor.dart';

///[get debug mode]
bool get isInDebugMode {
  var inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

void main() {
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await getFlavorSetting();
    await di.init();
    runApp(const App());

    ///[console] flavor running
    if (!kReleaseMode) {
      final settings = Config.getInstance();
      print('🚀 APP FLAVOR NAME      : ${settings.flavorName}');
      print('🚀 APP API_BASE_URL     : ${settings.apiBaseUrl}');
    }
  }, (e, s) async {
    if (isInDebugMode) {
      print('🔴 In dev mode. Not sending report.');
      print('ERROR :$e');
      print('STACKTRACE :$s');
    } else {
      print('🔴 OTHER_ERROR   :$e');
      print('🔴 STACKTRACE    :$s');
    }
  });
}

/// environment configuration
Future<FlavorSetting> getFlavorSetting() async {
  final flavor =
      await const MethodChannel('flavor').invokeMethod<String>('getFlavor');
  switch (flavor) {
    case 'development':
      return FlavorSetting.development();
    case 'staging':
      return FlavorSetting.staging();
    case 'production':
      return FlavorSetting.production();
    default:
      throw Exception('㊗️ Oopss... Flavor name missing');
  }
}
