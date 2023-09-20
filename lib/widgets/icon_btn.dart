import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconBtn extends StatelessWidget {
  const IconBtn({super.key, required this.onIconClick, required this.icon});

  final void Function() onIconClick;
  final FaIcon icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      color: Colors.white,
      onPressed: onIconClick,
    );
  }
}
