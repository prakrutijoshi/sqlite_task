import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_task/features/Audit/presentation/bloc/audit_bloc.dart';
import 'features/Audit/presentation/pages/myhomepage.dart';
import 'injection_container.dart' as i;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await i.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => i.sl<AuditBloc>()..add(const GetAllAuditEntityEvent()),
      child: MaterialApp(
          title: 'Audit Entities',
          theme: ThemeData(
            primarySwatch: Colors.brown,
          ),
          home: const MyHomePage(),
    ),
    );
  }
}

