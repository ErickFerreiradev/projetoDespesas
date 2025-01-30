import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  const AdaptativeButton(this.label, this.onPressed, {super.key});

  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? 
      CupertinoButton(
        color: Colors.white,
        child: Text(label, 
        style: TextStyle(color: Theme.of(context).colorScheme.primary,)), 
        onPressed: onPressed,
        )
    : ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      child: Text(
        label, 
        style: TextStyle(color: Theme.of(context).colorScheme.primary,)

        ),
      onPressed: onPressed,
    );
  }
}