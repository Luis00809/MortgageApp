import 'package:flutter/material.dart';
import 'package:mortgageapp/Models/mortgage.dart';

class PurchasePriceInput extends StatelessWidget {
  final MortgageCalculatorModel model;

  const PurchasePriceInput({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        double purchasePrice = double.tryParse(value) ?? 0;

        model.updateValues(
          purchasePrice,
          model.downPayment,
          model.interestRate,
        );
      },
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Purchase Price'),
    );
  }
}
