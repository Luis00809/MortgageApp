import 'package:flutter/material.dart';
import 'package:mortgageapp/Models/mortgage.dart';

class DownPaymentInput extends StatelessWidget {
  final MortgageCalculatorModel model;

  const DownPaymentInput({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        double downPayment = double.tryParse(value) ?? 0;
        model.updateValues(
          model.purchasePrice,
          downPayment,
          model.interestRate,
          model.loanTerm,
          model.pmi,
        );
      },
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Down payment'),
    );
  }
}
