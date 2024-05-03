// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:mortgageapp/monthly_payment.dart';
import 'package:provider/provider.dart';
import './Inputs/inputs.dart';
import './Models/mortgage.dart';

void main() {
  final mortgageCalculatorModel = MortgageCalculatorModel();

  runApp(
    ChangeNotifierProvider(
      create: (context) => mortgageCalculatorModel,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Corrected constructor

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mortgage Calculator'),
        ),
        body: const MortgageCalculator(),
      ),
    );
  }
}

class MortgageCalculator extends StatelessWidget {
  const MortgageCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MortgageCalculatorModel>(
      builder: (context, model, child) {
        return Column(
          children: [
            PurchasePriceInput(model: model),
            DownPaymentInput(model: model),
            InterestRateInput(model: model),
            ElevatedButton(
              onPressed: () {
                if (model.purchasePrice > 0 &&
                    model.downPayment > 0 &&
                    model.interestRate > 0) {
                  model.calculateMonthlyPaytment();
                } else {
                  const Text('please include valid inputs');
                }
              },
              child: const Text('Calculate Monthly Payment'),
            ),
            MonthlyPaymentDisplay(model: model),
          ],
        );
      },
    );
  }
}
