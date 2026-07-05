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
      appBar: AppBar(
        title: const Text(
          'VangtiChai',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade100,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // CHANGED: Reduced max width for tablets
              double maxContentWidth = 550.0;  // Was 700, now 550

              bool isLandscape = constraints.maxWidth > constraints.maxHeight;

              return SizedBox(
                width: constraints.maxWidth > maxContentWidth
                    ? maxContentWidth
                    : constraints.maxWidth,
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.paddingMedium),
                  child: isLandscape
                      ? _buildLandscapeLayout()
                      : _buildPortraitLayout(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
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
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppConstants.spacingLarge),
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ChangeTable(changeBreakdown: _changeBreakdown),
              ),
              SizedBox(width: AppConstants.spacingLarge),
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
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppConstants.spacingLarge),
              Expanded(
                child: ChangeTable(changeBreakdown: _changeBreakdown),
              ),
            ],
          ),
        ),
        SizedBox(width: AppConstants.spacingLarge),
        Expanded(
          flex: 1,
          child: NumericKeypad(
            onDigitPressed: _onDigitPressed,
            onClearPressed: _onClearPressed,
          ),
        ),
      ],
    );
  }
}