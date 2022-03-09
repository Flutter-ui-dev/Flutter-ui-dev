class Bill {
  final String name;
  final String amount;
  final String iconPath;

  Bill(this.name, this.amount, this.iconPath);
}

final List<Bill> billsData = [
  Bill(
    'Electricity Bill',
    '1240',
    'assets/icons/zap.svg',
  ),
  Bill(
    'Home Rent',
    '4600',
    'assets/icons/home.svg',
  ),
];
