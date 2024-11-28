import 'package:flutter/material.dart';

class UnknownView extends StatelessWidget {
  const UnknownView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      alignment: Alignment.center,
      child: const Text('Unknown Route!'),
    );
  }
}