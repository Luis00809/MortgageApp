import 'package:flutter/material.dart';
import 'package:mortgageapp/Models/mortgage.dart';

class LoanTermInput extends StatelessWidget {
  final MortgageCalculatorModel model;

  const LoanTermInput({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        double loanTerm = double.tryParse(value) ?? 30;
        model.updateValues(
            model.purchasePrice, 
            model.downPayment,
            model.interestRate,
            loanTerm,
            model.pmi,
            );
      },
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: "Loan Term"),
    );
  }
}
