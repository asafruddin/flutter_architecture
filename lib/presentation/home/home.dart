// ignore_for_file: use_named_constants

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_starter/core/constant/key_constant.dart';
import 'package:try_starter/core/di/injector_container.dart';
import 'package:try_starter/storage/local_storage.dart';
import 'package:try_starter/utils/ui/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SharedPrefs _prefs = sl<SharedPrefs>();
  ThemeBrightness theme = ThemeBrightness.light;

  void onSaveTheme() {
    Get.back<dynamic>();
    if (theme == ThemeBrightness.light) {
      Get.changeThemeMode(ThemeMode.light);
      _prefs.putBool(KeyConstant.keyThemeDark, false);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      _prefs.putBool(KeyConstant.keyThemeDark, true);
    }
  }

  @override
  void initState() {
    super.initState();
    final isDark = _prefs.isKeyExists(KeyConstant.keyThemeDark)
        ? _prefs.getBool(KeyConstant.keyThemeDark)
        : Get.isDarkMode;
    theme = isDark! ? ThemeBrightness.dark : ThemeBrightness.light;
  }

  Future<void> showChangeTheme() {
    return showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text('Chose Theme'),
              actions: [
                TextButton(
                    onPressed: () => Get.back<dynamic>(),
                    child: const Text('Cancel')),
                TextButton(onPressed: onSaveTheme, child: const Text('Save'))
              ],
              content: SingleChildScrollView(
                  child: StatefulBuilder(builder: (context, setState) {
                return Column(children: [
                  RadioListTile<ThemeBrightness>(
                      dense: true,
                      title: Text('Light',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: Get.isDarkMode
                                      ? CreateTheme.pureWhite
                                      : null)),
                      value: ThemeBrightness.light,
                      contentPadding: const EdgeInsets.all(0),
                      groupValue: theme,
                      onChanged: (ThemeBrightness? value) =>
                          setState(() => theme = value!)),
                  RadioListTile<ThemeBrightness>(
                      dense: true,
                      title: Text('Dark',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: Get.isDarkMode
                                      ? CreateTheme.pureWhite
                                      : null)),
                      contentPadding: const EdgeInsets.all(0),
                      value: ThemeBrightness.dark,
                      groupValue: theme,
                      onChanged: (ThemeBrightness? value) =>
                          setState(() => theme = value!))
                ]);
              })));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: const Icon(Icons.add)),
        body: Center(
            child: ElevatedButton(
                onPressed: showChangeTheme,
                child: const Text('Change Theme'))));
  }
}

enum ThemeBrightness { dark, light }
