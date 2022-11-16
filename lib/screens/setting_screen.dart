import 'package:flutter/material.dart';
import 'package:otdohni_app/widgets/custom_button.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  Widget _onPressed() {
    return Text('hello');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Settings',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        CustomButton(
          onPressed: _onPressed,
          icon: Icons.heart_broken_outlined,
          text: 'Write Review',
          borderRadiusTopLeft: 15,
          borderRadiusTopRight: 15,
          borderRadiusBottomLeft: 0,
          borderRadiusBottomRight: 0,
        ),
        CustomButton(
          onPressed: _onPressed,
          icon: Icons.star,
          text: 'Rate Us',
          borderRadiusTopLeft: 0,
          borderRadiusTopRight: 0,
          borderRadiusBottomLeft: 15,
          borderRadiusBottomRight: 15,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomButton(
          onPressed: _onPressed,
          icon: Icons.record_voice_over_outlined,
          text: 'Voice Assistance',
          borderRadiusTopLeft: 15,
          borderRadiusTopRight: 15,
          borderRadiusBottomLeft: 0,
          borderRadiusBottomRight: 0,
        ),
        CustomButton(
          onPressed: _onPressed,
          icon: Icons.volume_up_outlined,
          text: 'Sound Assistance',
          borderRadiusTopLeft: 0,
          borderRadiusTopRight: 0,
          borderRadiusBottomLeft: 0,
          borderRadiusBottomRight: 0,
        ),
        CustomButton(
          onPressed: _onPressed,
          icon: Icons.vibration_outlined,
          text: 'Harpic Assistance',
          borderRadiusTopLeft: 0,
          borderRadiusTopRight: 0,
          borderRadiusBottomLeft: 15,
          borderRadiusBottomRight: 15,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomButton(
          onPressed: _onPressed,
          icon: Icons.color_lens_outlined,
          text: 'Color Schemes',
          borderRadiusTopLeft: 15,
          borderRadiusTopRight: 15,
          borderRadiusBottomLeft: 15,
          borderRadiusBottomRight: 15,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomButton(
          onPressed: _onPressed,
          icon: Icons.ios_share,
          text: 'Share',
          borderRadiusTopLeft: 15,
          borderRadiusTopRight: 15,
          borderRadiusBottomLeft: 0,
          borderRadiusBottomRight: 0,
        ),
        CustomButton(
          onPressed: _onPressed,
          icon: Icons.contact_support_outlined,
          text: 'Support',
          borderRadiusTopLeft: 0,
          borderRadiusTopRight: 0,
          borderRadiusBottomLeft: 15,
          borderRadiusBottomRight: 15,
        ),
      ],
    );
  }
}
