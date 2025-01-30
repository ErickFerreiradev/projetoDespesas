import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class AdaptativeTextfield extends StatelessWidget {
  const AdaptativeTextfield(this.controller, this.keyboardType, this.onSubmitted, this.label, {super.key});

  final String? label;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? 
      CupertinoTextField(
        controller: controller,
        keyboardType: keyboardType,
        onSubmitted: onSubmitted,
        placeholder: label,
      ) : TextField(
                  controller: controller,
                      keyboardType: keyboardType,
                      onSubmitted: onSubmitted,
                      decoration: InputDecoration(
                        labelText: label,
                    ),
        );
  }
}