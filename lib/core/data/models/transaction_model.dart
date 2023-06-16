class TransactionModel {
  final String title;
  final String subTitle;
  final double pricing;

  TransactionModel({
    required this.title,
    required this.subTitle,
    required this.pricing,
  });
}

TransactionModel transactionModel = TransactionModel(
  title: 'Welton',
  subTitle: 'Today at 09:20 am',
  pricing: 570.00,
);
