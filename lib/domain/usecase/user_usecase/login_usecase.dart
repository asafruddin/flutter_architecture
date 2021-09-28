import 'package:dartz/dartz.dart';
import 'package:try_starter/core/exceptions/failure.dart';
import 'package:try_starter/core/usecase/usecase.dart';
import 'package:try_starter/data/model/request/login_body.dart';
import 'package:try_starter/domain/entity/user_entity/login_entity.dart';
import 'package:try_starter/domain/repositories/user_repository.dart';

class LoginUseCase extends UseCase<LoginEntity, LoginBody> {
  LoginUseCase(this.repository);

  final UserRepository repository;

  @override
  Stream<Either<Failure, LoginEntity>> build(LoginBody params) {
    return repository.requestLogin(params);
  }
}
