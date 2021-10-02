// ignore_for_file: use_named_constants

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ThemeBrightness theme = ThemeBrightness.light;

  void onSaveTheme() {
    Get.back<dynamic>();
    if (theme == ThemeBrightness.light) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
  }

  @override
  void initState() {
    super.initState();

    theme = Get.isDarkMode ? ThemeBrightness.dark : ThemeBrightness.light;
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
                      title: const Text('Light'),
                      value: ThemeBrightness.light,
                      contentPadding: const EdgeInsets.all(0),
                      groupValue: theme,
                      onChanged: (ThemeBrightness? value) =>
                          setState(() => theme = value!)),
                  RadioListTile<ThemeBrightness>(
                      dense: true,
                      title: const Text('Dark'),
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
        body: Center(
            child: ElevatedButton(
                onPressed: showChangeTheme,
                child: const Text('Change Theme'))));
  }
}

enum ThemeBrightness { dark, light }
