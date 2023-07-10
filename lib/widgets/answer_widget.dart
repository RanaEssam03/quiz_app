import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({
    super.key,
    required this.ans,
    required this.fun,
  });

  final String ans;
  final void Function(String str) fun;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 8,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsetsDirectional.symmetric(
            vertical: 8,
            horizontal: 20,
          ),
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).colorScheme.background.withOpacity(
                0.8,
              ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
          elevation: 6,
        ),
        onPressed: () {
          fun(ans);
        },
        child: Text(
          ans,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
