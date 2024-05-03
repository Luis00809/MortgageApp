import 'package:flutter/foundation.dart';
import 'dart:math';

class MortgageCalculatorModel extends ChangeNotifier {
  double purchasePrice = 0;
  double downPayment = 0;
  double interestRate = 0;
  double monthlyPayment = 0;

  void updateValues(
      double purchasePrice, double downPayment, double interestRate) {
    this.purchasePrice = purchasePrice;
    this.downPayment = downPayment;
    this.interestRate = interestRate;
    notifyListeners();
  }

  void calculateMonthlyPaytment() {
    print('this is the purchase price: $purchasePrice');
    print('this is the downpayment: $downPayment');
    print('this is the interest rate: $interestRate');

    // gets principle payment
    double principal = purchasePrice - downPayment;

    // now need to get monthly interest rate
    double monthlyInterest = interestRate / 12 / 100;

    // calculate # of payments, will get user value later.
    int numberOfPayments = 360;

    // monthly payment calculation
    double monthlyPayment = principal *
        (monthlyInterest * pow(1 + monthlyInterest, numberOfPayments)) /
        (pow(1 + monthlyInterest, numberOfPayments) - 1);

    // Update the monthlyPayment property
    this.monthlyPayment = monthlyPayment;
    print('monthly: $monthlyPayment');

    // Notify listeners of the change
    notifyListeners();
  }
}
