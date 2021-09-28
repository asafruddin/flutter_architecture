import 'package:dio/dio.dart';
import 'package:try_starter/core/di/injector_container.dart';
import 'package:try_starter/data/datasource/binding_datasources.dart';
import 'package:try_starter/data/model/request/login_body.dart';
import 'package:try_starter/data/model/response/user_response/login_model.dart';
import 'package:try_starter/domain/entity/user_entity/login_entity.dart';
import 'package:try_starter/storage/local_storage.dart';

class BindingRemote implements BindingDataSources {
  BindingRemote(this._client);

  late final Dio _client;
  SharedPrefs? prefs = sl<SharedPrefs>();

  @override
  Stream<LoginEntity> requestLogin(LoginBody body) async* {
    final Response response =
        await _client.post<Response>('/v1/auth/login', data: body.toJson());
    yield LoginModel.fromJson(response.data as Map<String, dynamic>);
  }
}
