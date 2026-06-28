VANGTICHAI - Change Calculator App
===================================

CSE 489:
Assignment 1
Author Name:Md.Hasibul Islam Shimanto
Brac University

IMPLEMENTATION DETAILS:

- Framework: Flutter (Dart)
- Minimum API: Android 5.0 (API 21)
- Layout: ConstraintLayout alternative using Flutter's LayoutBuilder

FEATURES IMPLEMENTED:

Numeric keypad (0-9 digits + Clear button)
Change calculation for Taka notes: 500, 100, 50, 20, 10, 5, 2, 1
Amount display with "Taka:" label
Portrait & Landscape layouts
State preservation on orientation change
Responsive design for phones and tablets
No hardcoded values - using constants file

HOW CHANGE IS CALCULATED:
-------------------------
Amount entered via keypad → Convert to integer →
Divide by 500, 100, 50, 20, 10, 5, 2, 1 →
Display count for each note
