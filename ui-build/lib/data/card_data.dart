class BankCard {
  final String cardName;
  final String bank;
  final String no;
  final String userName;
  final String cardProvider;

  BankCard(this.cardName, this.bank, this.no, this.userName, this.cardProvider);
}

final List<BankCard> cardData = [
  BankCard(
    'HDFC Bank Platinum Card',
    'hdfc-bank',
    '4621 XXXX XXXX 5406',
    'Rohan Sooryavanshi',
    'mastercard',
  ),
  BankCard(
    'ICICI Bank Elite Card',
    'icici-bank',
    '5842 XXXX XXXX 1011',
    'Akhilesh Yadav',
    'mastercard',
  ),
  BankCard(
    'Kotak Bank VIP Card',
    'kotak-bank',
    '8869 XXXX XXXX 4404',
    'Suraj Rajpal',
    'visa',
  ),
];
