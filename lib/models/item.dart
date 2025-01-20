class MenuItem {
  final String id;
  final String menuItemId;
  final String storeId;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final List<String> includedItems;

  MenuItem({
    required this.id,
    required this.menuItemId,
    required this.storeId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.includedItems,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
    id: json['ID'] as String,
    menuItemId: json['MenuItemID'] as String,
    storeId: json['StoreID'] as String,
    title: json['Title']['en'] as String,
    description: json['Description']['en'] as String,
    imageUrl: json['ImageURL'] as String,
    price: (json['PriceInfo']['Price']['DeliveryPrice'] as num).toDouble(),
    includedItems: _parseIncludedItems(json['Description']['en']),
  );

  static List<String> _parseIncludedItems(String description) {
    final items = description.split(',');
    return items.map((item) => item.trim()).toList();
  }
}