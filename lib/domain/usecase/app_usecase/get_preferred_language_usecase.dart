import 'package:dartz/dartz.dart';
import 'package:try_starter/core/exceptions/failure.dart';
import 'package:try_starter/core/use_case/use_case.dart';
import 'package:try_starter/domain/repositories/app_repository.dart';

class GetPreferredLanguageUseCase extends UseCase<String, NoParams> {
  GetPreferredLanguageUseCase(this.repository);

  final AppRepository repository;

  @override
  Stream<Either<Failure, String>> build(NoParams params) {
    return repository.getPreferredLanguage();
  }
}
