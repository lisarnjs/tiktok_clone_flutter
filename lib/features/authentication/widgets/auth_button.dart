import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:titok_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  // final void Function(BuildContext) onTapFunction;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    // required this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size14,
          horizontal: Sizes.size16,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: Sizes.size1,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: icon,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
    // return GestureDetector(
    //   onTap: () => onTapFunction(context),
    //   child: FractionallySizedBox(
    //     widthFactor: 1,
    //     child: Container(
    //       padding: const EdgeInsets.symmetric(
    //         vertical: Sizes.size14,
    //         horizontal: Sizes.size16,
    //       ),
    //       decoration: BoxDecoration(
    //         border: Border.all(
    //           color: Colors.grey.shade300,
    //           width: Sizes.size1,
    //         ),
    //       ),
    //       child: Stack(
    //         alignment: Alignment.center,
    //         children: [
    //           Align(
    //             alignment: Alignment.centerLeft,
    //             child: icon,
    //           ),
    //           Text(
    //             text,
    //             textAlign: TextAlign.center,
    //             style: const TextStyle(
    //               fontSize: Sizes.size16,
    //               fontWeight: FontWeight.w600,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
