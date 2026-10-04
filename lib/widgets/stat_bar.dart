import 'package:flutter/material.dart';

import '../theme/mbq_colors.dart';

// Satu baris bar statistik: label + bar proporsional + angka.
// Bar dibuat murni dari Expanded(flex) dalam Row, tanpa package chart.
class StatBar extends StatelessWidget {
  final String label;
  final int value; // harus di rentang 1-99 agar flex tidak 0

  const StatBar(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(label)),
        Expanded(
          child: Row(
            children: [
              // lebar bar proporsional terhadap nilai lewat rasio flex
              Expanded(
                flex: value,
                child: Container(height: 16, color: mbqNavy),
              ),
              Expanded(
                flex: 100 - value,
                child: Container(height: 16, color: Colors.grey.shade300),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text("$value"),
      ],
    );
  }
}
