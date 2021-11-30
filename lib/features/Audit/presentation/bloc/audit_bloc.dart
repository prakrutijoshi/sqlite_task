import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sqlite_task/core/error/failure.dart';
import 'package:sqlite_task/core/usecases/usecases.dart';
import 'package:sqlite_task/features/Audit/data/datasources/database/drift_database.dart';
import 'package:sqlite_task/features/Audit/domain/usecases/add_audit_entities.dart';
import 'package:sqlite_task/features/Audit/domain/usecases/delete_audit_entities.dart';
import 'package:sqlite_task/features/Audit/domain/usecases/edit_audit_entities.dart';
import 'package:sqlite_task/features/Audit/domain/usecases/get_audit_entities.dart';

part 'audit_event.dart';
part 'audit_state.dart';

const String LOCAL_FAILURE_MESSAGE = 'Local Failure';
class AuditBloc extends Bloc<AuditEvent, AuditState> {
  final GetAuditEntities getAuditEntities;
  final AddAuditEntities addAuditEntities;
  final DeleteAuditEntities deleteAuditEntities;
  final EditAuditEntities updateAuditEntities;

  AuditBloc(this.getAuditEntities, this.updateAuditEntities,
      this.deleteAuditEntities, this.addAuditEntities)
      : super(Empty());

  @override
  Stream<AuditState> mapEventToState (
      AuditEvent event,
      ) async* {
    if (event is GetAllAuditEntityEvent) {
      yield* _getAllSavedArticles();
    }
    if (event is DeleteAuditEntityEvent) {
      await deleteAuditEntities(event.auditEntities!);
      yield* _getAllSavedArticles();
    }
    if (event is AddAuditEntityEvent) {
      await addAuditEntities(NoParams());
      yield* _getAllSavedArticles();
    }
    if (event is EditAuditEntityEvent) {
      await updateAuditEntities(event.auditEntities!);
      yield* _getAllSavedArticles();
    }
  }
  Stream<AuditState> _getAllSavedArticles() async* {
    yield Loading();
    final getAuditEntitiesList = await getAuditEntities(NoParams());
    yield* _eitherLoadedOrErrorState(getAuditEntitiesList);
  }

  Stream<AuditState> _eitherLoadedOrErrorState(
      Either<Failure, List<AuditEntities?>?>? either,
      ) async* {
    if(either != null)
    {
      yield either.fold(
            (failure) => Error(msg: _mapFailureToMessage(failure)),
            (list) => Loaded(auditEntitiesList: list),
      );
    }
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case LocalFailure:
        return LOCAL_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
  }

