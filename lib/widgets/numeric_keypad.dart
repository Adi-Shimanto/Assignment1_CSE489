import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class NumericKeypad extends StatelessWidget {
  final Function(String) onDigitPressed;
  final VoidCallback onClearPressed;

  const NumericKeypad({
    super.key,
    required this.onDigitPressed,
    required this.onClearPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Adjust button size based on available space
        double buttonSize = constraints.maxWidth / 3.5;
        double fontSize = buttonSize * 0.4;

        return GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: AppConstants.spacingMedium,
          crossAxisSpacing: AppConstants.spacingMedium,
          children: [
            _buildKeypadButton('7', buttonSize, fontSize),
            _buildKeypadButton('8', buttonSize, fontSize),
            _buildKeypadButton('9', buttonSize, fontSize),
            _buildKeypadButton('4', buttonSize, fontSize),
            _buildKeypadButton('5', buttonSize, fontSize),
            _buildKeypadButton('6', buttonSize, fontSize),
            _buildKeypadButton('1', buttonSize, fontSize),
            _buildKeypadButton('2', buttonSize, fontSize),
            _buildKeypadButton('3', buttonSize, fontSize),
            _buildClearButton(buttonSize, fontSize),
            _buildKeypadButton('0', buttonSize, fontSize),
            // Empty space for alignment
            const SizedBox(),
          ],
        );
      },
    );
  }

  Widget _buildKeypadButton(String digit, double size, double fontSize) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        onPressed: () => onDigitPressed(digit),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 2.0,
        ),
        child: Text(
          digit,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildClearButton(double size, double fontSize) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        onPressed: onClearPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: AppConstants.clearButtonColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          ),
          elevation: 2.0,
        ),
        child: Icon(
          Icons.clear,
          size: fontSize * 1.2,
        ),
      ),
    );
  }
}