class Product {
  final String serialNumber;
  final String description;
  final int categoryId;
  final String brand;
  final String type;
  final double quantity;
  final int locationId;

  Product({
    required this.serialNumber,
    required this.description,
    required this.categoryId,
    required this.brand,
    required this.type,
    required this.quantity,
    required this.locationId,

  });

  Map <String, dynamic> toJson(){
    return{
      'serial_number' : serialNumber,
      'description' : description,
      'category_id' : categoryId,
      'brand': brand,
      'type' : type,
      'quantity' : quantity,
      'location_id' : locationId,
    };

  }
}

