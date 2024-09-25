import 'package:flutter/material.dart';
import 'const_var.dart';

class HeaderWithTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  HeaderWithTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: DARK_PRI_COLOR,
      shape: Border(
        bottom: BorderSide(
          color: Colors.black38,
          width: 2,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
