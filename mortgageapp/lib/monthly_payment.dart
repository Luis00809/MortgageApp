import 'package:flutter/material.dart';
import 'package:mortgageapp/Models/mortgage.dart';
import 'package:provider/provider.dart';

class MonthlyPaymentDisplay extends StatelessWidget {
  final MortgageCalculatorModel model;

  const MonthlyPaymentDisplay({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Consumer<MortgageCalculatorModel>(
      builder: (context, model, child) {
        return Text(
          'Monthly Payment: \$${model.monthlyPayment.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 24),
        );
      },
    );
  }
}
