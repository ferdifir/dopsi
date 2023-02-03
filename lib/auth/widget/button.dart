import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.width,
    required this.text,
    required this.withIcon,
    required this.onPressed
  }) : super(key: key);

  final double width;
  final String text;
  final bool withIcon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var icon = withIcon
        ? Row(
            children: const [
              Icon(Icons.facebook),
              SizedBox(
                width: 10,
              ),
            ],
          )
        : Row();
    return Container(
      margin: const EdgeInsets.all(20),
      width: width,
      height: 50,
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
