import 'package:flutter/material.dart';

class DisplayMsg extends StatelessWidget {
  final String msg;

  const DisplayMsg({
    Key? key,
    required this.msg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            msg,
            style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20, 
                fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
