import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:try_starter/bloc/login/login_bloc_bloc.dart';
import 'package:try_starter/core/di/injector_container.dart';
import 'package:try_starter/data/model/request/login_body.dart';
import 'package:try_starter/presentation/home/home.dart';
import 'package:try_starter/utils/ui/widget/textfield_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userController = TextEditingController();

  final LoginBloc _loginBloc = sl<LoginBloc>();

  void onLogin() {
    final body = LoginBody(username: '11136', password: '11136');
    _loginBloc.add(OnLoginEvent(body));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: BlocListener<LoginBloc, LoginBlocState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            final snackBar = SnackBar(content: Text(state.message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is LoginSuccess) {
            Get.to<dynamic>(const HomeScreen());
          }
        },
        child: Scaffold(
            body: Stack(
          children: [
            Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  const Text('Login'),
                  TextFieldForm(
                      controller: userController, hintText: 'Username'),
                  const SizedBox(height: 10),
                  TextFieldForm(
                      controller: userController, hintText: 'Password'),
                  const SizedBox(height: 10),
                  ElevatedButton(onPressed: onLogin, child: const Text('Login'))
                ])),
            BlocBuilder<LoginBloc, LoginBlocState>(builder: (context, state) {
              if (state is LoginLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const SizedBox();
              }
            })
          ],
        )),
      ),
    );
  }
}
