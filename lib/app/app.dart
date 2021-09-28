import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:try_starter/l10n/l10n.dart';
import 'package:try_starter/presentation/login/login_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            colorScheme:
                ColorScheme.fromSwatch(accentColor: const Color(0xFF13B9FF))),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const LoginScreen());
  }
}
