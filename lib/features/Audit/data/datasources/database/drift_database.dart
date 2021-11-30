import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:sqlite_task/features/Audit/data/datasources/dao/audit_entities_dao.dart';
import 'package:sqlite_task/features/Audit/domain/entities/Audit_entities.dart';

part 'drift_database.g.dart';

@DataClassName("AuditEntities")
class AuditEntitiesTable extends Table{

  IntColumn get auditEntityId => integer().nullable()();

  IntColumn get auditId => integer().nullable()();

  TextColumn get auditEntityName => text().nullable()();

  IntColumn get auditEntityTypeId => integer().nullable()();

  IntColumn get auditParentEntityId => integer().nullable()();

  IntColumn get sequenceNo => integer().nullable()();

  DateTimeColumn get entityEndDate => dateTime().nullable()();

  BoolColumn get isLeafNod => boolean().nullable()();

  TextColumn get barcodeNFC => text().nullable()();

  IntColumn get entityLevel => integer().nullable()();

  BoolColumn get entityException => boolean().nullable()();

  TextColumn get scheduleOccurrenceIds => text().nullable()();

  @override
  Set<Column> get primaryKey => {auditEntityId};

}

@DriftDatabase(tables: [AuditEntitiesTable], daos:[AuditEntitiesDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor ex) : super(ex);

  @override
  int get schemaVersion => 1;
}

LazyDatabase openConnection() {
  return LazyDatabase(() async{
    final dbFolder = await getDatabasesPath();
    final file = File(path.join(dbFolder , 'db.sqlite'));
    return NativeDatabase(file);
  });
}