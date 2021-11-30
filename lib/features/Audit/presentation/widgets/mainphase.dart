import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sqlite_task/features/Audit/data/datasources/database/drift_database.dart';
import 'package:sqlite_task/features/Audit/presentation/bloc/audit_bloc.dart';
import 'package:sqlite_task/features/Audit/presentation/widgets/alertdialogbox.dart';

class MainPhase extends StatefulWidget {
  final List<AuditEntities?> auditList;
  const MainPhase({required this.auditList, Key? key}) : super(key: key);

  @override
  State<MainPhase> createState() => _MainPhaseState();
}

class _MainPhaseState extends State<MainPhase> {
  @override
  Widget build(BuildContext context) {
    if(widget.auditList.isEmpty) {
      _AddAuditEntity(context);
    }
    return ListView.builder(
        itemBuilder:(_, index) {
          final item = widget.auditList[index];
          return _buildList(context, item);
        }
    );
  }


Widget _buildList(BuildContext context, AuditEntities? auditEntities) {
  return Card(
    elevation: 1,
    child: Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            label: 'Edit',
            backgroundColor: Colors.blueGrey,
            icon: Icons.edit,
            onPressed: (_) => _toEditEntity(context, auditEntities),
          ),

          SlidableAction(
            label: 'Delete',
            backgroundColor: Colors.red,
            icon: Icons.delete,
            onPressed: (_) => _todeleteEntity(context, auditEntities),
          ),
        ],
      ),
      child: ListTile(
        leading:const Icon(Icons.arrow_forward, color: Colors.brown),
        title: Text(
          auditEntities!.auditEntityName.toString(),
          style:
              const TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
                fontSize: 20,
              ),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          auditEntities.entityEndDate.toString(),
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.blueGrey,
            fontSize: 15,
          ),
        ),
      ),
    ),
  );
}

Future<void> _todeleteEntity(BuildContext context, AuditEntities? auditEntities) async {
  final RequestDelete = await AlertDialogBox(
      context,
      title: 'Delete the Audit Entity',
      content: 'Are You Sure You Want To Delete?',
      ActionText: 'OK',
      cancleActiontext: 'CANCEL');
  if (RequestDelete == true)
  {
    BlocProvider.of<AuditBloc>(context)
        .add(DeleteAuditEntityEvent(auditEntities!));
  }
}

Future<void> _toEditEntity(BuildContext context, AuditEntities? auditEntities) async {
  var values = auditEntities!.auditEntityName.toString();
  final RequestEdit = await showDialog(
    context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Update Audit Entity', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.brown)),
            content: TextField(
              controller: TextEditingController()..text = values,
              onChanged:(value) {
                setState(() {
                  values = value;
                });
              },
            ),
              actions: [

                OutlinedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white70)),
                  onPressed: () =>Navigator.of(context).pop(true),
                  child: const Text("UPDATE", style: TextStyle(color: Colors.brown),),
                ),
                OutlinedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white70)),
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('CANCEL', style: TextStyle(color: Colors.red),),
                ),
              ],
          ),
      );

  if(RequestEdit == true)
  {
    BlocProvider.of<AuditBloc>(context)
        .add(EditAuditEntityEvent(auditEntities.copyWith(auditEntityName: values)));
  }
}

  void _AddAuditEntity(BuildContext context) {
    BlocProvider.of<AuditBloc>(context)
        .add(const AddAuditEntityEvent());
  }
}

