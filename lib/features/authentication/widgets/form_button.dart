import 'package:flutter/material.dart';
import 'package:titok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  // const FormButton({
  //   super.key,
  //   required String username,
  // }) : _username = username;

  // final String _username;
  const FormButton({
    super.key,
    required this.disabled,
    this.buttonText,
  });
  final bool disabled;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size5),
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
        ),
        duration: const Duration(milliseconds: 500),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          style: TextStyle(
            color: disabled ? Colors.grey.shade400 : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          child: Text(
            buttonText ?? "Next",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
