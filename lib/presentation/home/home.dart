// ignore_for_file: use_named_constants, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_starter/bloc/movie/search_movies_bloc.dart';
import 'package:try_starter/core/constant/key_constant.dart';
import 'package:try_starter/core/di/injector_container.dart';
import 'package:try_starter/data/model/request/search_movie_body.dart';
import 'package:try_starter/domain/entity/movie_entity/search_result_movie_entity.dart';
import 'package:try_starter/storage/local_storage.dart';
import 'package:try_starter/utils/ui/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchBloc = sl<SearchMoviesBloc>();

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

    final body = SearchMovieBody(page: '1', search: 'Transformers');

    _searchBloc.fetchSearchMovies(body);
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
        body: StreamBuilder<SearchResultMovieEntity>(
            stream: _searchBloc.data,
            builder: (context, snapshot) {
              final data = snapshot.hasData ? snapshot.data : null;

              return ListView.separated(
                  padding: const EdgeInsets.only(top: 16, bottom: 50),
                  itemBuilder: (context, i) {
                    return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        decoration: const BoxDecoration(),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                      data?.Search?[i].Poster ?? '',
                                      width: Get.width / 4,
                                      fit: BoxFit.fitWidth)),
                              const SizedBox(width: 10),
                              Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    Text(data?.Search?[i].Title ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis),
                                    Row(
                                      children: [
                                        Text(data?.Search?[i].Year ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2),
                                        Text(' | ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption),
                                        Text(data?.Search?[i].Type ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2)
                                      ],
                                    ),
                                  ])),
                            ]));
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 5),
                  itemCount: data?.Search?.length ?? 0);
            }));
  }
}

enum ThemeBrightness { dark, light }
