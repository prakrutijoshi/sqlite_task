import 'package:dartz/dartz.dart';
import 'package:sqlite_task/core/error/failure.dart';
import 'package:sqlite_task/core/usecases/usecases.dart';
import 'package:sqlite_task/features/Audit/data/datasources/database/drift_database.dart';

import 'package:sqlite_task/features/Audit/domain/repositories/audit_repository.dart';

class EditAuditEntities extends UseCases<void, AuditEntities>{
  final AuditEntitiesRepository repository;

  EditAuditEntities(this.repository);

  @override
  Future<Either<Failure, void>?>? call(AuditEntities params) async {
    return await repository.editAuditEntities(params);
  }




}