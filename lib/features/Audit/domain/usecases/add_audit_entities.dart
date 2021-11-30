import 'package:dartz/dartz.dart';
import 'package:sqlite_task/core/error/failure.dart';
import 'package:sqlite_task/core/usecases/usecases.dart';
import 'package:sqlite_task/features/Audit/domain/repositories/audit_repository.dart';

class AddAuditEntities extends UseCases<void, NoParams> {
  final AuditEntitiesRepository repository;

  AddAuditEntities(this.repository);

  @override
  Future<Either<Failure, void>?>? call(NoParams params) async {
    return await repository.addAuditEntities();
  }


}