import 'package:dartz/dartz.dart';
import 'package:sqlite_task/core/error/failure.dart';
import 'package:sqlite_task/core/usecases/usecases.dart';
import 'package:sqlite_task/features/Audit/data/datasources/database/drift_database.dart';

import 'package:sqlite_task/features/Audit/domain/repositories/audit_repository.dart';

class GetAuditEntities extends UseCases<List<AuditEntities?>, NoParams> {
  final AuditEntitiesRepository repository;

  GetAuditEntities(this.repository);

  @override
  Future<Either<Failure, List<AuditEntities?>>?>? call(NoParams params)  async {
    return await repository.getAuditEntities();
  }


}