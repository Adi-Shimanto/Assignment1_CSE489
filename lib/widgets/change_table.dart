import 'package:flutter/material.dart';
import '../models/change_calculator.dart';
import '../constants/app_constants.dart';

class ChangeTable extends StatelessWidget {
  final Map<int, int> changeBreakdown;

  const ChangeTable({super.key, required this.changeBreakdown});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppConstants.borderColorMedium),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(AppConstants.paddingSmall),
            decoration: BoxDecoration(
              color: AppConstants.headerBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(7.0),
                topRight: Radius.circular(7.0),
              ),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Text(
                    'Note',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Count',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Rows
          Expanded(
            child: ListView.builder(
              itemCount: ChangeCalculator.noteDenominations.length,
              itemBuilder: (context, index) {
                int note = ChangeCalculator.noteDenominations[index];
                int count = changeBreakdown[note] ?? 0;

                return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: AppConstants.paddingSmall,
                    horizontal: AppConstants.paddingSmall,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppConstants.borderColorLight,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '৳$note',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: AppConstants.bodySize,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          count.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: AppConstants.bodySize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}