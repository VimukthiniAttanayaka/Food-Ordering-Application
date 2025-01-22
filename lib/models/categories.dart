class Category {
  final String id;
  final String menuCategoryID;
  final String menuID;
  final String storeID;
  Title title;
  Title subTitle;
  final List<MenuEntity>? menuEntities;

  Category({
    required this.id,
    required this.menuCategoryID,
    required this.menuID,
    required this.storeID,
    required this.title,
    required this.subTitle,
    required this.menuEntities,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["ID"] ?? '',
        menuCategoryID: json["MenuCategoryID"] ?? '',
        menuID: json["MenuID"] ?? '',
        storeID: json["StoreID"] ?? '',
        title: Title.fromJson(json['Title']),
        subTitle: Title.fromJson(json['Title']),
        menuEntities: json['MenuEntities'] != null
            ? List<MenuEntity>.from((json['MenuEntities'] as List<dynamic>)
                .map((x) => MenuEntity.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "MenuCategoryID": menuCategoryID,
        "MenuID": menuID,
        "StoreID": storeID,
        'Title': title.toJson(),
        "SubTitle": subTitle.toJson(),
        "MenuEntities": menuEntities ?? [],
      };
}

class Title {
  String en;

  Title({required this.en});

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(en: json['en']);
  }

  Map<String, dynamic> toJson() {
    return {'en': en};
  }
}

class MenuEntity {
  final String id;
  final String type;

  MenuEntity({
    required this.id,
    required this.type,
  });

  factory MenuEntity.fromJson(Map<String, dynamic> json) => MenuEntity(
        id: json["ID"],
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Type": type,
      };
}
