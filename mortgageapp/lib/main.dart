import 'package:flutter/material.dart';
import 'package:mortgageapp/Inputs/private_mortgage_insurance.dart';
import 'package:mortgageapp/monthly_payment.dart';
import 'package:provider/provider.dart';
import './Inputs/inputs.dart';
import './Models/mortgage.dart';
import './charts/piechart.dart';

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
  const MyApp({super.key}); 

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

class MortgageCalculator extends StatefulWidget {
  const MortgageCalculator({super.key});

  @override
  _MortgageCalculatorState createState() => _MortgageCalculatorState();
}

class _MortgageCalculatorState extends State<MortgageCalculator> {
  bool _showChart = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<MortgageCalculatorModel>(
      builder: (context, model, child) {
        return Column(
          children: [
            PurchasePriceInput(model: model),
            DownPaymentInput(model: model),
            InterestRateInput(model: model),
            LoanTermInput(model: model),
            PMI(model: model),
            ElevatedButton(
              onPressed: () {
                if (model.purchasePrice > 0 ||
                    model.downPayment > 0 ||
                    model.interestRate > 0) {
                  model.calculateMonthlyPayment();
                  setState(() {
                    _showChart = true; // Toggle visibility
                  });
                } else {
                  const Text('Please include valid inputs');
                }
              },
              child: const Text('Calculate Monthly Payment'),
            ),
            Visibility(
              visible: _showChart,
              child: SizedBox(
                height: 300,
                width: 300,
                child: DonutChart(
                  principalPayment: model.principalPayment,
                  interestPayment: model.interestPayment,
                  pmiPayment: model.pmiPayment,
                ),
              ),
            ),
            MonthlyPaymentDisplay(model: model),
          ],
        );
      },
    );
  }
}
