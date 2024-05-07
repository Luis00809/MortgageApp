import 'package:flutter/material.dart';
import 'package:mortgageapp/Models/mortgage.dart';

class InterestRateInput extends StatelessWidget {
  final MortgageCalculatorModel model;

  const InterestRateInput({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
     onChanged: (value) {
        double interestRate = double.tryParse(value)?? 0;
        model.updateValues(
          model.purchasePrice, 
          model.downPayment, 
          interestRate,
          model.loanTerm,
          model.pmi,
        );
      },
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Interest rate'),
    );
  }
}
