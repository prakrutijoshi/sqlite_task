

import 'package:drift/drift.dart';
import 'package:sqlite_task/features/Audit/data/datasources/database/drift_database.dart';

part 'audit_entities_dao.g.dart';

@DriftAccessor(tables: [AuditEntitiesTable])
class AuditEntitiesDao extends DatabaseAccessor<AppDatabase>
    with _$AuditEntitiesDaoMixin {
  final AppDatabase db;

  AuditEntitiesDao(this.db) : super(db);

  Future<List<AuditEntities>> watchAllAuditEntity() => select(auditEntitiesTable).get();

  Future<void> insertAuditEntity(List<AuditEntitiesTableCompanion> auditEntities) async{
    await batch((batch) {
      batch.insertAll(auditEntitiesTable, auditEntities);
    });
  }


  Future editAuditEntity(Insertable<AuditEntities> auditEntities) =>
      update(auditEntitiesTable).replace(auditEntities);

  Future deleteAuditEntity(Insertable<AuditEntities> auditEntities) =>
      delete(auditEntitiesTable).delete(auditEntities);
}
