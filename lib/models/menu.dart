class Menu {
  final String id;
  final String menuID;
  final String verticalID;
  final String storeID;
  final Map<String, String> title;
  final String? subTitle;
  final String? description;
  final Map<String, MenuAvailability> menuAvailability;
  final List<String> menuCategoryIDs;
  final String createdDate;
  final String modifiedDate;
  final String createdBy;
  final String modifiedBy;

  Menu({
    required this.id,
    required this.menuID,
    required this.verticalID,
    required this.storeID,
    required this.title,
    this.subTitle,
    this.description,
    required this.menuAvailability,
    required this.menuCategoryIDs,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["ID"] ?? '',
        menuID: json["MenuID"] ?? '',
        verticalID: json["VerticalID"] ?? '',
        storeID: json["StoreID"] ?? '',
        title: Map.from(json["Title"]).map((k, v) => MapEntry(k, v)),
        subTitle: json["SubTitle"],
        description: json["Description"],
        menuAvailability: Map.from(json["MenuAvailability"])
            .map((k, v) => MapEntry(k, MenuAvailability.fromJson(v))),
        menuCategoryIDs:
            List<String>.from(json["MenuCategoryIDs"].map((x) => x)),
        createdDate: json["CreatedDate"],
        modifiedDate: json["ModifiedDate"],
        createdBy: json["CreatedBy"],
        modifiedBy: json["ModifiedBy"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "MenuID": menuID,
        "VerticalID": verticalID,
        "StoreID": storeID,
        "Title": Map.from(title),
        "SubTitle": subTitle,
        "Description": description,
        "MenuAvailability":
            Map.from(menuAvailability).map((k, v) => MapEntry(k, v.toJson())),
        "MenuCategoryIDs": List<dynamic>.from(menuCategoryIDs.map((x) => x)),
        "CreatedDate": createdDate,
        "ModifiedDate": modifiedDate,
        "CreatedBy": createdBy,
        "ModifiedBy": modifiedBy,
      };
}

class MenuAvailability {
  final String startTime;
  final String endTime;

  MenuAvailability({
    required this.startTime,
    required this.endTime,
  });

  factory MenuAvailability.fromJson(Map<String, dynamic> json) =>
      MenuAvailability(
        startTime: json["StartTime"],
        endTime: json["EndTime"],
      );

  Map<String, dynamic> toJson() => {
        "StartTime": startTime,
        "EndTime": endTime,
      };
}
