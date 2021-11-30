import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:sqlite_task/core/error/failure.dart';
import 'package:sqlite_task/features/Audit/data/datasources/database/drift_database.dart';
import 'package:sqlite_task/features/Audit/data/models/audit_entities_model.dart';
import 'package:sqlite_task/features/Audit/domain/repositories/audit_repository.dart';

class AuditEntitiesRepositoryImpl implements AuditEntitiesRepository {
  final AppDatabase appDatabase;

  AuditEntitiesRepositoryImpl({required this.appDatabase});

  Future<Either<Failure, void>?>? AddDta() async {
    try {
      var jsonText = await rootBundle.loadString('assets/entity.json');
      Map<String, dynamic> map = json.decode(jsonText);
      List<dynamic> data = map["auditEntity"];
      List<AuditEntitiesModel> subList = data.map((e) => AuditEntitiesModel.fromJson(e)).toList();
      List<AuditEntitiesTableCompanion> list = [];

      for (var element in subList) {
        final data = AuditEntitiesTableCompanion.insert(
          entityException: Value(element.entityException),
          entityEndDate: Value(element.entityEndDate),
          entityLevel: Value(element.entityLevel),
          auditEntityName: Value(element.auditEntityName),
          auditEntityId: Value(element.auditEntityId),
          auditEntityTypeId: Value(element.auditEntityTypeId),
          auditId: Value(element.auditId),
          auditParentEntityId: Value(element.auditParentEntityId),
          barcodeNFC: Value(element.barcodeNFC),
          isLeafNod: Value(element.isLeafNod),
          scheduleOccurrenceIds: Value(element.scheduleOccurrenceIds),
          sequenceNo: Value(element.sequenceNo),
        );
        list.add(data);
      }
      print(list);
      final add = await appDatabase.auditEntitiesDao
          .insertAuditEntity(list);
      return Right(add);
    } catch (e) {
      return Left(LocalFailure());
    }
  }
  @override
  Future<Either<Failure, void>?>? addAuditEntities() async {
    try {
      var jsonText = await rootBundle.loadString('assets/entity.json');
      Map<String, dynamic> map = json.decode(jsonText);
      List<dynamic> data = map["auditEntity"];
      List<AuditEntitiesModel> subList = data.map((e) => AuditEntitiesModel.fromJson(e)).toList();
      List<AuditEntitiesTableCompanion> list = [];

      for (var element in subList) {
        final data = AuditEntitiesTableCompanion.insert(
          entityException: Value(element.entityException),
          entityEndDate: Value(element.entityEndDate),
          entityLevel: Value(element.entityLevel),
          auditEntityName: Value(element.auditEntityName),
          auditEntityId: Value(element.auditEntityId),
          auditEntityTypeId: Value(element.auditEntityTypeId),
          auditId: Value(element.auditId),
          auditParentEntityId: Value(element.auditParentEntityId),
          barcodeNFC: Value(element.barcodeNFC),
          isLeafNod: Value(element.isLeafNod),
          scheduleOccurrenceIds: Value(element.scheduleOccurrenceIds),
          sequenceNo: Value(element.sequenceNo),
        );
        list.add(data);
      }
      print(list);
      final add = await appDatabase.auditEntitiesDao
          .insertAuditEntity(list);
      return Right(add);
    } catch (e) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>?>? deleteAuditEntities(AuditEntities auditEntities) async {
    final delete= await appDatabase.auditEntitiesDao.deleteAuditEntity(auditEntities as Insertable<AuditEntities>);
    return Right(delete);
  }

  @override
  Future<Either<Failure, void>?>? editAuditEntities(AuditEntities auditEntities) async {
    final edit = await appDatabase.auditEntitiesDao.editAuditEntity(auditEntities as Insertable<AuditEntities>);
    return Right(edit);
  }

  @override
  Future<Either<Failure, List<AuditEntities?>>?>? getAuditEntities() async {
    try {
      final get = await appDatabase.auditEntitiesDao.watchAllAuditEntity();
      return Right(get);
    }on Exception {
      return Left(LocalFailure());
    }
  }



  }


