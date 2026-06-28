import 'package:flutter/material.dart';
import '../models/change_calculator.dart';
import '../widgets/numeric_keypad.dart';
import '../widgets/change_table.dart';
import '../constants/app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _amount = '0';
  Map<int, int> _changeBreakdown = {};

  @override
  void initState() {
    super.initState();
    _updateChange();
  }

  void _updateChange() {
    int amount = int.tryParse(_amount) ?? 0;
    setState(() {
      _changeBreakdown = ChangeCalculator.calculateChange(amount);
    });
  }

  void _onDigitPressed(String digit) {
    setState(() {
      if (_amount == '0') {
        _amount = digit;
      } else {
        _amount = _amount + digit;
      }
    });
    _updateChange();
  }

  void _onClearPressed() {
    setState(() {
      _amount = '0';
    });
    _updateChange();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Check if landscape mode
            bool isLandscape = constraints.maxWidth > constraints.maxHeight;

            if (isLandscape) {
              return _buildLandscapeLayout();
            } else {
              return _buildPortraitLayout();
            }
          },
        ),
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Padding(
      padding: EdgeInsets.all(AppConstants.paddingMedium),
      child: Column(
        children: [
          // Amount Display
          Container(
            padding: EdgeInsets.all(AppConstants.paddingMedium),
            decoration: BoxDecoration(
              border: Border.all(color: AppConstants.borderColorMedium),
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Taka:',
                  style: TextStyle(
                    fontSize: AppConstants.headingSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _amount,
                  style: TextStyle(
                    fontSize: AppConstants.headingSize,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppConstants.spacingLarge),
          // Change Table and Keypad in Row
          Expanded(
            child: Row(
              children: [
                // Change Table - Left side
                Expanded(
                  flex: 1,
                  child: ChangeTable(changeBreakdown: _changeBreakdown),
                ),
                SizedBox(width: AppConstants.spacingLarge),
                // Numeric Keypad - Right side
                Expanded(
                  flex: 1,
                  child: NumericKeypad(
                    onDigitPressed: _onDigitPressed,
                    onClearPressed: _onClearPressed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Padding(
      padding: EdgeInsets.all(AppConstants.paddingMedium),
      child: Row(
        children: [

          Expanded(
            flex: 1,
            child: Column(
              children: [

                Container(
                  padding: EdgeInsets.all(AppConstants.paddingMedium),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppConstants.borderColorMedium),
                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Taka:',
                        style: TextStyle(
                          fontSize: AppConstants.headingSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _amount,
                        style: TextStyle(
                          fontSize: AppConstants.headingSize,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppConstants.spacingLarge),
                // Change Table
                Expanded(
                  child: ChangeTable(changeBreakdown: _changeBreakdown),
                ),
              ],
            ),
          ),
          SizedBox(width: AppConstants.spacingLarge),
          // Right side - Numeric Keypad
          Expanded(
            flex: 1,
            child: NumericKeypad(
              onDigitPressed: _onDigitPressed,
              onClearPressed: _onClearPressed,
            ),
          ),
        ],
      ),
    );
  }
}