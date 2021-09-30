import 'package:dartz/dartz.dart';
import 'package:try_starter/core/exceptions/failure.dart';
import 'package:try_starter/core/use_case/use_case.dart';
import 'package:try_starter/domain/repositories/app_repository.dart';

class UpdatePreferredLanguageUseCase extends UseCase<void, String> {
  UpdatePreferredLanguageUseCase(this.repository);

  final AppRepository repository;

  @override
  Stream<Either<Failure, void>> build(String params) {
    return repository.updatePreferredLanguage(params);
  }
}
