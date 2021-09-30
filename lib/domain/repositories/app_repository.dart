import 'package:dartz/dartz.dart';
import 'package:try_starter/core/exceptions/failure.dart';

abstract class AppRepository {
  Stream<Either<Failure, String>> getPreferredLanguage();
  Stream<Either<Failure, void>> updatePreferredLanguage(String code);
}
