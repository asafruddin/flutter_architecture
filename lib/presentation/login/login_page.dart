import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:try_starter/bloc/language/language_bloc.dart';
import 'package:try_starter/bloc/login/login_bloc.dart';
import 'package:try_starter/core/constant/key_constant.dart';
import 'package:try_starter/core/constant/language_constant.dart';
import 'package:try_starter/core/constant/translation_constant.dart';
import 'package:try_starter/core/di/injector_container.dart';
import 'package:try_starter/core/extension/string_extension.dart';
import 'package:try_starter/data/model/request/login_body.dart';
import 'package:try_starter/presentation/home/home.dart';
import 'package:try_starter/storage/local_storage.dart';
import 'package:try_starter/utils/ui/widget/text_field_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userController = TextEditingController();
  final passController = TextEditingController();

  final LoginBloc _loginBloc = sl<LoginBloc>();
  final LanguageBloc _languageBloc = sl<LanguageBloc>();
  final _prefs = sl<SharedPrefs>();

  late String selectedLanguage;

  void onLogin() {
    final body =
        LoginBody(username: userController.text, password: passController.text);
    _loginBloc.add(OnLoginEvent(body));
  }

  void onChangeLanguage(String? value) {
    setState(() {
      selectedLanguage = value!;
      if (selectedLanguage == 'id') {
        _languageBloc.add(ToggleLanguageEvent(Languages.languages.first));
      } else {
        _languageBloc.add(ToggleLanguageEvent(Languages.languages.last));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    final code = _prefs.getString(KeyConstant.keyLanguage);
    selectedLanguage = code ?? 'id';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _loginBloc, child: buildBlocListener());
  }

  BlocListener<LoginBloc, LoginBlocState> buildBlocListener() {
    return BlocListener<LoginBloc, LoginBlocState>(
        child: Scaffold(appBar: buildAppBar(), body: buildMainContent()),
        listener: (context, state) {
          if (state is LoginFailure) {
            final snackBar = SnackBar(content: Text(state.message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is LoginSuccess) {
            Get.off<dynamic>(() => const HomeScreen());
          }
        });
  }

  AppBar buildAppBar() {
    return AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
      DropdownButton<String>(
          value: selectedLanguage,
          underline: const SizedBox(),
          onChanged: onChangeLanguage,
          items: Languages.languages
              .map((e) =>
                  DropdownMenuItem<String>(value: e.code, child: Text(e.code!)))
              .toList())
    ]);
  }

  Stack buildMainContent() {
    return Stack(children: [
      Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(R.login.t(context)!, style: Theme.of(context).textTheme.bodyLarge),
        TextFieldForm(controller: userController, hintText: 'Username'),
        const SizedBox(height: 10),
        TextFieldForm(controller: passController, hintText: 'Password'),
        const SizedBox(height: 10),
        ElevatedButton(onPressed: onLogin, child: Text(R.login.t(context)!))
      ])),
      buildBlocBuilder()
    ]);
  }

  BlocBuilder<LoginBloc, LoginBlocState> buildBlocBuilder() {
    return BlocBuilder<LoginBloc, LoginBlocState>(builder: (context, state) {
      if (state is LoginLoading) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return const SizedBox();
      }
    });
  }
}
