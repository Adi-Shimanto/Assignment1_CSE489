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
        // Calculate button size
        double buttonSize;


        if (constraints.maxWidth > 400) {
          buttonSize = 65.0;
        } else {
          buttonSize = constraints.maxWidth / 3.5;
          if (buttonSize > 70.0) buttonSize = 70.0;
          if (buttonSize < 50.0) buttonSize = 50.0;
        }

        double fontSize = buttonSize * 0.4;

        return Center(
          child: SizedBox(
            width: buttonSize * 3 + AppConstants.spacingMedium * 2,
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              mainAxisSpacing: AppConstants.spacingMedium,
              crossAxisSpacing: AppConstants.spacingMedium,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // Row 1: 1, 2, 3
                _buildKeypadButton('1', buttonSize, fontSize),
                _buildKeypadButton('2', buttonSize, fontSize),
                _buildKeypadButton('3', buttonSize, fontSize),

                // Row 2: 4, 5, 6
                _buildKeypadButton('4', buttonSize, fontSize),
                _buildKeypadButton('5', buttonSize, fontSize),
                _buildKeypadButton('6', buttonSize, fontSize),

                // Row 3: 7, 8, 9
                _buildKeypadButton('7', buttonSize, fontSize),
                _buildKeypadButton('8', buttonSize, fontSize),
                _buildKeypadButton('9', buttonSize, fontSize),

                // Row 4: 0, CLEAR
                _buildKeypadButton('0', buttonSize, fontSize),
                _buildClearButton(buttonSize, fontSize),
              ],
            ),
          ),
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
          side: BorderSide(color: Colors.grey.shade300),
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
        child: Text(
          'CLEAR',
          style: TextStyle(
            fontSize: fontSize * 0.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}