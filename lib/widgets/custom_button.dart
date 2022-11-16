import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  final double borderRadiusTopLeft;
  final double borderRadiusTopRight;
  final double borderRadiusBottomLeft;
  final double borderRadiusBottomRight;

  CustomButton({
    required this.onPressed,
    required this.icon,
    required this.text,
    required this.borderRadiusTopLeft,
    required this.borderRadiusTopRight,
    required this.borderRadiusBottomLeft,
    required this.borderRadiusBottomRight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: ElevatedButton(
        onPressed: () async {
          onPressed();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 35.0,
            ),
            Text(
              text,
              style: const TextStyle(
                //color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 25.0,
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadiusTopLeft),
              topRight: Radius.circular(borderRadiusTopRight),
              bottomLeft: Radius.circular(borderRadiusBottomLeft),
              bottomRight: Radius.circular(borderRadiusBottomRight),
            ),
          ),
        ),
      ),
    );
  }
}
