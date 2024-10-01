class Product {
  int id;
  String title;
  String description;
  String photo;
  double price;
  int discount;
  bool isFavorite;

  Product({
        required this.id,
        required this.title,
        required this.description,
        required this.photo,
        required this.price,
        required this.discount,
        this.isFavorite = false
  });
}