import 'package:flutter/material.dart';

class DonationProvider with ChangeNotifier {
  int _donationCount = 0;

  int get donationCount => _donationCount;

  void addDonation(int amount) {
    _donationCount += amount;
    notifyListeners(); // Notifies the UI to update
  }
}
