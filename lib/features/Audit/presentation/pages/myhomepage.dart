import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_task/features/Audit/presentation/bloc/audit_bloc.dart';
import 'package:sqlite_task/features/Audit/presentation/widgets/displaymsg.dart';
import 'package:sqlite_task/features/Audit/presentation/widgets/loadingphase.dart';
import 'package:sqlite_task/features/Audit/presentation/widgets/mainphase.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Audit Entities"),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Column(
        children:[
          Expanded(
            child: _buildbody(context),
          ),
        ],
      ),
    );
  }


}

Widget _buildbody(BuildContext context) {
  return BlocBuilder<AuditBloc, AuditState>(
      builder: (context, state){
        if(state is Empty) {
          return const DisplayMsg(
              msg: 'Lets Begin!'
          );
        } else if(state is Loading) {
          return const LoadingPhase();
        } else if(state is Loaded) {
          return MainPhase(auditList: state.auditEntitiesList!);
        } else if(state is Error) {
          return DisplayMsg(
            msg: state.msg,
          );
        }
        return Container(decoration: const BoxDecoration(color: Colors.red));
      }
  );
}

