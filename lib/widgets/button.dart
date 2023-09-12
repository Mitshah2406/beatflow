import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.text,
      required this.clickHandler,
      required this.logo});
  final String text;
  final void Function() clickHandler;
  final FaIcon logo;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: clickHandler,
      style: ElevatedButton.styleFrom(
        // alignment: Alignment.ce,
        maximumSize: const Size(500, 80),
        minimumSize: const Size(350, 50),
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
              width: 1.0, color: Color.fromARGB(133, 255, 255, 255)),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      icon: logo,
      label: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 12,
          ),
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
