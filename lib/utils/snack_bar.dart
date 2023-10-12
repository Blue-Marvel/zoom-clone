import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

showSnackBar(BuildContext context, String error) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(error))
  );
}
