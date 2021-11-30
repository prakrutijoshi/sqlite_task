part of 'audit_bloc.dart';

abstract class AuditState extends Equatable {
  const AuditState();
}

class Empty extends AuditState {
  @override
  List<Object?> get props => [];
}

class Loading extends AuditState{
  @override
  List<Object?> get props => [];
}

class Loaded extends AuditState{
  final List<AuditEntities?>? auditEntitiesList;
   const Loaded({required this.auditEntitiesList});

   @override
  List<Object> get props => [auditEntitiesList!];
}

class Error extends AuditState{
  final String msg;
  const Error({required this.msg});

  @override
  List<Object> get props => [msg];
}


