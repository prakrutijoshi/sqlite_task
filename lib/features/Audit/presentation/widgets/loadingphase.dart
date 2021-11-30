import 'package:flutter/material.dart';

class LoadingPhase extends StatelessWidget {
  const LoadingPhase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/2,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      ),
    );
  }
}
