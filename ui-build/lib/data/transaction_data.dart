class Transaction {
  final String name;
  final String paidWith;
  final String amount;

  Transaction(this.name, this.paidWith, this.amount);
}

final List<Transaction> transactionData = [
  Transaction('Hazzel\'s Cafe', 'HDFC Bank Platinum Card', '660'),
  Transaction('Latitude Dining', 'ICICI Bank Elite Card', '1020'),
  Transaction('Green Leaf Hotel', 'Kotak Bank VIP Card', '3420'),
  Transaction('Kream N Krunch', 'HDFC Bank Platinum Card', '180'),
  Transaction('Barkhat Tea House', 'ICICI Bank Elite Card', '80'),
  Transaction('Hazzel\'s Cafe', 'HDFC Bank Platinum Card', '660'),
  Transaction('Hazzel\'s Cafe', 'HDFC Bank Platinum Card', '660'),
  Transaction('Hazzel\'s Cafe', 'HDFC Bank Platinum Card', '660'),
];
