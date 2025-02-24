class Product {
  final String name;
  final String image;
  final int currentPrice;
  final int originalPrice;
  final double discount;
  final int savings;

  const Product({
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.originalPrice,
    required this.discount,
    required this.savings,
  });
}
