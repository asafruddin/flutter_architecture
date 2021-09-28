import 'package:dartz/dartz.dart';
import 'package:try_starter/core/exceptions/failure.dart';
import 'package:try_starter/data/model/request/login_body.dart';
import 'package:try_starter/domain/entity/user_entity/login_entity.dart';

abstract class UserRepository {
  Stream<Either<Failure, LoginEntity>> requestLogin(LoginBody body);
}
