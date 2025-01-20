class Menu {
  final String id;
  final String menuID;
  final String verticalID;
  final String storeID;
  final Map<String, String> title;

  Menu({
    required this.id,
    required this.menuID,
    required this.verticalID,
    required this.storeID,
    required this.title,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['ID'] ?? '',
      menuID: json['MenuID'] ?? '',
      verticalID: json['VerticalID'] ?? '',
      storeID: json['StoreID'] ?? '',
      title: Map<String, String>.from(json['Title']),
    );
  }
}