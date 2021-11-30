part of 'audit_bloc.dart';

abstract class AuditEvent extends Equatable {
  final AuditEntities? auditEntities;
  const AuditEvent({this.auditEntities});

  @override
  List<Object> get props => [auditEntities!];
}


class GetAllAuditEntityEvent extends AuditEvent{
  const GetAllAuditEntityEvent();
}

class DeleteAuditEntityEvent extends AuditEvent{
  const DeleteAuditEntityEvent(AuditEntities auditEntities) :super(auditEntities: auditEntities);
}

class AddAuditEntityEvent extends AuditEvent{
  const AddAuditEntityEvent() : super();
}

class EditAuditEntityEvent extends AuditEvent{
  const EditAuditEntityEvent(AuditEntities auditEntities) : super(auditEntities: auditEntities);
}