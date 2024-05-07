import 'package:flutter/foundation.dart';
import 'dart:math';

class MortgageCalculatorModel extends ChangeNotifier {
  double purchasePrice = 0;
  double downPayment = 0;
  double interestRate = 0;
  double monthlyPayment = 0;
  double loanTerm = 0;
  double pmi = 0;

  double principalPayment = 0;
  double interestPayment = 0;
  double pmiPayment = 0;

  void updateValues(double purchasePrice, double downPayment,
      double interestRate, double loanTerm, double pmi) {
    this.purchasePrice = purchasePrice;
    this.downPayment = downPayment;
    this.interestRate = interestRate;
    this.loanTerm = loanTerm;
    this.pmi = pmi;
    notifyListeners();
  }

  void calculateMonthlyPayment() {
    // gets principle payment
    double principal = purchasePrice - downPayment;

    // now need to get monthly interest rate
    double monthlyInterest = interestRate / 12 / 100;

    // calculate # of payments, will get user value later.
    double numberOfPayments = loanTerm * 12;

    // monthly payment calculation
    double monthlyPayment = principal *
        (monthlyInterest * pow(1 + monthlyInterest, numberOfPayments)) /
        (pow(1 + monthlyInterest, numberOfPayments) - 1);

    /// Update the monthlyPayment property
    this.monthlyPayment = monthlyPayment;

    interestPayment = (principal * monthlyInterest);
    principalPayment = monthlyPayment - interestPayment;


    if (pmi > 0) {
      // Calculate the PMI amount
      double pmiAmount = principal * (pmi / 100) / 12;
      this.monthlyPayment += pmiAmount;
      pmiPayment = pmiAmount;
      notifyListeners();
    } else {
      // If no PMI is provided, notify listeners without adding PMI to the monthly payment
      pmiPayment = 0;
      notifyListeners();
    }
  }
}
