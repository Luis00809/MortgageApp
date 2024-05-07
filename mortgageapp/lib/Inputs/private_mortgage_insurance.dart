import 'package:flutter/material.dart';
import 'package:mortgageapp/Models/mortgage.dart';

class PMI extends StatelessWidget {
  final MortgageCalculatorModel model;

  const PMI({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        double pmi = double.tryParse(value) ?? 0;
        model.updateValues(
          model.purchasePrice,
          model.downPayment,
          model.interestRate,
          model.loanTerm,
          pmi,
        );
      },
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'PMI?'),
    );
  }
}
