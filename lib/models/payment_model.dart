class PaymentModel {
  final String id;
  final String customerName;
  final double amount;
  final String status;

  PaymentModel({
    required this.id,
    required this.customerName,
    required this.amount,
    required this.status,
  });
}