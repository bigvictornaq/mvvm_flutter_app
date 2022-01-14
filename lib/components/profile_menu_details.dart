import 'package:flutter/material.dart';
import 'package:mvvvm_app/util/constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    this.iconSrc,
    this.title,
    this.press,
  }) : super(key: key);

  final String? title;
  final Icon? iconSrc;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            iconSrc!,
            SizedBox(
              width: 2.0,
            ),
            Text(
              title!,
              style: TextStyle(fontSize: 22.0, color: color_verde_1),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18.0,
              color: color_verde,
            ),
          ],
        ),
      ),
    );
  }
}
