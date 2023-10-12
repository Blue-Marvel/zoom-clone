import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BtnLoader extends StatelessWidget {
  const BtnLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        height: deviceHeight * 0.02,
        width: deviceHeight * 0.02,
        child: const CircularProgressIndicator.adaptive(backgroundColor: Colors.white,),
      ),
    );
  }
}
