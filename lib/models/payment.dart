enum PaymentStatus { paid, unpaid }

class Payment {
  final String id;
  final double amount;
  final String note;
  final DateTime date;
  final PaymentStatus status;
  final String personName;

  Payment(
      {required this.id,
      required this.amount,
      required this.note,
      required this.date,
      required this.status,
      required this.personName});
}
