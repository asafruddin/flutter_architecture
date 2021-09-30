import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:try_starter/bloc/language/language_bloc.dart';
import 'package:try_starter/core/constant/key_constant.dart';
import 'package:try_starter/core/constant/language_constant.dart';
import 'package:try_starter/core/di/injector_container.dart';
import 'package:try_starter/l10n/localization.dart';
import 'package:try_starter/presentation/home/home.dart';
import 'package:try_starter/presentation/login/login_page.dart';
import 'package:try_starter/storage/local_storage.dart';
import 'package:try_starter/utils/ui/theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _languageBloc = sl<LanguageBloc>();
  final _prefs = sl<SharedPrefs>();

  @override
  void initState() {
    super.initState();
    _languageBloc.add(LoadPreferredLanguageEvent());
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    super.dispose();
    _languageBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final isLogin = _prefs.isKeyExists(KeyConstant.keyAccessToken);

    return BlocProvider<LanguageBloc>.value(
        value: _languageBloc,
        child:
            BlocBuilder<LanguageBloc, LanguageState>(builder: (context, state) {
          if (state is LanguageLoaded) {
            return GetMaterialApp(
                locale: Get.deviceLocale,
                theme: CreateTheme.themeData,
                themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                supportedLocales:
                    Languages.languages.map((e) => Locale(e.code!)).toList(),
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate
                ],
                home: isLogin ? const HomeScreen() : const LoginScreen());
          } else {
            return const SizedBox.shrink();
          }
        }));
  }
}
