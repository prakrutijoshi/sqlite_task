import 'package:dartz/dartz.dart';
import 'package:sqlite_task/core/error/failure.dart';
import 'package:sqlite_task/features/Audit/data/datasources/database/drift_database.dart';


abstract class AuditEntitiesRepository{
  Future<Either<Failure,List<AuditEntities?>>?>? getAuditEntities();
  Future<Either<Failure, void>?>? editAuditEntities(AuditEntities auditEntities);
  Future<Either<Failure, void>?>? addAuditEntities();
  Future<Either<Failure, void>?>? deleteAuditEntities(AuditEntities auditEntities);
}