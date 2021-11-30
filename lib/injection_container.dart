import 'package:get_it/get_it.dart';
import 'package:sqlite_task/features/Audit/data/datasources/dao/audit_entities_dao.dart';
import 'package:sqlite_task/features/Audit/data/datasources/database/drift_database.dart';
import 'package:sqlite_task/features/Audit/data/repositories/audit_entities_repository_impl.dart';
import 'package:sqlite_task/features/Audit/domain/repositories/audit_repository.dart';
import 'package:sqlite_task/features/Audit/domain/usecases/add_audit_entities.dart';
import 'package:sqlite_task/features/Audit/domain/usecases/delete_audit_entities.dart';
import 'package:sqlite_task/features/Audit/domain/usecases/edit_audit_entities.dart';
import 'package:sqlite_task/features/Audit/domain/usecases/get_audit_entities.dart';
import 'package:sqlite_task/features/Audit/presentation/bloc/audit_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //Bloc
  sl.registerFactory(
          () => AuditBloc(
              sl(),
              sl(),
              sl(),
              sl(),
          ),
    );

  //UseCases
  sl.registerFactory(() => GetAuditEntities(sl()));
  sl.registerFactory(() => AddAuditEntities(sl()));
  sl.registerFactory(() => DeleteAuditEntities(sl()));
  sl.registerFactory(() => EditAuditEntities(sl()));

  //Repositories
  sl.registerLazySingleton<AuditEntitiesRepository>(
          () => AuditEntitiesRepositoryImpl(appDatabase: sl()));

  sl.registerSingleton(AppDatabase(openConnection()));

  //Dio Client
  sl.registerSingleton<AuditEntitiesDao>(AuditEntitiesDao(sl()));
}