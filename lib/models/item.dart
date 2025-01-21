class MenuItem {
  String id;
  String menuItemId;
  String storeId;
  Title title;
  Title description;
  String imageUrl;
  PriceInfo priceInfo;
  String externalData;
  QuantityInfo quantityInfo;
  SuspensionRules suspensionRules;
  ModifierGroupRules modifierGroupRules;
  RewardGroupRules rewardGroupRules;
  TaxInfo taxInfo;
  int aggregatedProductRating;
  int totalReviews;
  DateTime createdDate;
  DateTime modifiedDate;
  NutrientData nutrientData;
  DishInfo dishInfo;
  VisibilityInfo visibilityInfo;
  ProductInfo productInfo;
  List<String>? bundleItems;
  BeverageInfo beverageInfo;
  List<String> categoryIds;
  List<String>? allergens;
  MetaData metaData;

  MenuItem({
    required this.id,
    required this.menuItemId,
    required this.storeId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.priceInfo,
    required this.externalData,
    required this.quantityInfo,
    required this.suspensionRules,
    required this.modifierGroupRules,
    required this.rewardGroupRules,
    required this.taxInfo,
    required this.aggregatedProductRating,
    required this.totalReviews,
    required this.createdDate,
    required this.modifiedDate,
    required this.nutrientData,
    required this.dishInfo,
    required this.visibilityInfo,
    required this.productInfo,
    this.bundleItems,
    required this.beverageInfo,
    required this.categoryIds,
    this.allergens,
    required this.metaData,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['ID'],
      menuItemId: json['MenuItemID'],
      storeId: json['StoreID'],
      title: Title.fromJson(json['Title']),
      description: Title.fromJson(json['Description']),
      imageUrl: json['ImageURL'],
      priceInfo: PriceInfo.fromJson(json['PriceInfo']),
      externalData: json['ExternalData'],
      quantityInfo: QuantityInfo.fromJson(json['QuantityInfo']),
      suspensionRules: SuspensionRules.fromJson(json['SuspensionRules']),
      modifierGroupRules:
          ModifierGroupRules.fromJson(json['ModifierGroupRules']),
      rewardGroupRules: RewardGroupRules.fromJson(json['RewardGroupRules']),
      taxInfo: TaxInfo.fromJson(json['TaxInfo']),
      aggregatedProductRating: json['AggregatedProductRating'],
      totalReviews: json['TotalReviews'],
      createdDate: DateTime.parse(json['CreatedDate']),
      modifiedDate: DateTime.parse(json['ModifiedDate']),
      nutrientData: NutrientData.fromJson(json['NutrientData']),
      dishInfo: DishInfo.fromJson(json['DishInfo']),
      visibilityInfo: VisibilityInfo.fromJson(json['VisibilityInfo']),
      productInfo: ProductInfo.fromJson(json['ProductInfo']),
      bundleItems: json['BundleItems'] != null
          ? List<String>.from(json['BundleItems'])
          : null,
      beverageInfo: BeverageInfo.fromJson(json['BeverageInfo']),
      categoryIds: json['CategoryIDs'] != null
          ? List<String>.from(json['CategoryIDs'])
          : [],
      allergens: json['Allergens'] != null
          ? List<String>.from(json['Allergens'])
          : null,
      metaData: MetaData.fromJson(json['MetaData']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'MenuItemID': menuItemId,
      'StoreID': storeId,
      'Title': title.toJson(),
      'Description': description.toJson(),
      'ImageURL': imageUrl,
      'PriceInfo': priceInfo.toJson(),
      'ExternalData': externalData,
      'QuantityInfo': quantityInfo.toJson(),
      'SuspensionRules': suspensionRules.toJson(),
      'ModifierGroupRules': modifierGroupRules.toJson(),
      'RewardGroupRules': rewardGroupRules.toJson(),
      'TaxInfo': taxInfo.toJson(),
      'AggregatedProductRating': aggregatedProductRating,
      'TotalReviews': totalReviews,
      'CreatedDate': createdDate.toIso8601String(),
      'ModifiedDate': modifiedDate.toIso8601String(),
      'NutrientData': nutrientData.toJson(),
      'DishInfo': dishInfo.toJson(),
      'VisibilityInfo': visibilityInfo.toJson(),
      'ProductInfo': productInfo.toJson(),
      'BundleItems': bundleItems,
      'BeverageInfo': beverageInfo.toJson(),
      'CategoryIDs': categoryIds,
      'Allergens': allergens,
      'MetaData': metaData.toJson(),
    };
  }
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

class PriceInfo {
  Price price;
  int corePrice;
  int containerDeposit;
  dynamic overrides;
  String priceByUnit;

  PriceInfo({
    required this.price,
    required this.corePrice,
    required this.containerDeposit,
    required this.overrides,
    required this.priceByUnit,
  });

  factory PriceInfo.fromJson(Map<String, dynamic> json) {
    return PriceInfo(
      price: Price.fromJson(json['Price']),
      corePrice: json['CorePrice'],
      containerDeposit: json['ContainerDeposit'],
      overrides: json['Overrides'],
      priceByUnit: json['PricebyUnit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Price': price.toJson(),
      'CorePrice': corePrice,
      'ContainerDeposit': containerDeposit,
      'Overrides': overrides,
      'PricebyUnit': priceByUnit,
    };
  }
}

class Price {
  int deliveryPrice;
  int pickupPrice;
  int tablePrice;

  Price({
    required this.deliveryPrice,
    required this.pickupPrice,
    required this.tablePrice,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      deliveryPrice: json['DeliveryPrice'],
      pickupPrice: json['PickupPrice'],
      tablePrice: json['TablePrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'DeliveryPrice': deliveryPrice,
      'PickupPrice': pickupPrice,
      'TablePrice': tablePrice,
    };
  }
}

class QuantityInfo {
  Quantity quantity;
  dynamic overrides;

  QuantityInfo({
    required this.quantity,
    required this.overrides,
  });

  factory QuantityInfo.fromJson(Map<String, dynamic> json) {
    return QuantityInfo(
      quantity: Quantity.fromJson(json['Quantity']),
      overrides: json['Overrides'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Quantity': quantity.toJson(),
      'Overrides': overrides,
    };
  }
}

class Quantity {
  int minPermitted;
  int maxPermitted;
  bool isMinPermittedOptional;
  int chargeAbove;
  int refundUnder;
  int minPermittedUnique;
  int maxPermittedUnique;

  Quantity({
    required this.minPermitted,
    required this.maxPermitted,
    required this.isMinPermittedOptional,
    required this.chargeAbove,
    required this.refundUnder,
    required this.minPermittedUnique,
    required this.maxPermittedUnique,
  });

  factory Quantity.fromJson(Map<String, dynamic> json) {
    return Quantity(
      minPermitted: json['MinPermitted'],
      maxPermitted: json['MaxPermitted'],
      isMinPermittedOptional: json['IsMinPermittedOptional'],
      chargeAbove: json['ChargeAbove'],
      refundUnder: json['RefundUnder'],
      minPermittedUnique: json['MinPermittedUnique'],
      maxPermittedUnique: json['MaxPermittedUnique'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'MinPermitted': minPermitted,
      'MaxPermitted': maxPermitted,
      'IsMinPermittedOptional': isMinPermittedOptional,
      'ChargeAbove': chargeAbove,
      'RefundUnder': refundUnder,
      'MinPermittedUnique': minPermittedUnique,
      'MaxPermittedUnique': maxPermittedUnique,
    };
  }
}

class SuspensionRules {
  Suspension suspension;
  dynamic suspensionOverride;

  SuspensionRules({
    required this.suspension,
    required this.suspensionOverride,
  });

  factory SuspensionRules.fromJson(Map<String, dynamic> json) {
    return SuspensionRules(
      suspension: Suspension.fromJson(json['Suspension']),
      suspensionOverride: json['SuspensionOverride'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Suspension': suspension.toJson(),
      'SuspensionOverride': suspensionOverride,
    };
  }
}

class Suspension {
  int suspendedUntil;
  bool isSuspended;
  String reason;

  Suspension({
    required this.suspendedUntil,
    required this.isSuspended,
    required this.reason,
  });

  factory Suspension.fromJson(Map<String, dynamic> json) {
    return Suspension(
      suspendedUntil: json['SuspendedUntil'],
      isSuspended: json['IsSuspended'],
      reason: json['Reason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'SuspendedUntil': suspendedUntil,
      'IsSuspended': isSuspended,
      'Reason': reason,
    };
  }
}

class ModifierGroupRules {
  List<String>? ids;
  List<dynamic>? overrides;

  ModifierGroupRules({
    this.ids,
    this.overrides,
  });

  factory ModifierGroupRules.fromJson(Map<String, dynamic> json) {
    return ModifierGroupRules(
      ids: json['IDs'] != null ? List<String>.from(json['IDs']) : null,
      overrides: json['Overrides'] != null
          ? List<dynamic>.from(json['Overrides'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IDs': ids ?? [],
      'Overrides': overrides ?? [],
    };
  }
}

class RewardGroupRules {
  Reward reward;
  dynamic overrides;

  RewardGroupRules({
    required this.reward,
    required this.overrides,
  });

  factory RewardGroupRules.fromJson(Map<String, dynamic> json) {
    return RewardGroupRules(
      reward: Reward.fromJson(json['Reward']),
      overrides: json['Overrides'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Reward': reward.toJson(),
      'Overrides': overrides,
    };
  }
}

class Reward {
  String type;
  int defaultValue;
  int multiplierValue;
  int customValue;
  bool isMultiplierRequired;

  Reward({
    required this.type,
    required this.defaultValue,
    required this.multiplierValue,
    required this.customValue,
    required this.isMultiplierRequired,
  });

  factory Reward.fromJson(Map<String, dynamic> json) {
    return Reward(
      type: json['Type'],
      defaultValue: json['DefaultValue'],
      multiplierValue: json['MultiplierValue'],
      customValue: json['CustomValue'],
      isMultiplierRequired: json['IsMutiplierRequired'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Type': type,
      'DefaultValue': defaultValue,
      'MultiplierValue': multiplierValue,
      'CustomValue': customValue,
      'IsMutiplierRequired': isMultiplierRequired,
    };
  }
}

class TaxInfo {
  int taxRate;
  int vatRateInPercentage;

  TaxInfo({
    required this.taxRate,
    required this.vatRateInPercentage,
  });

  factory TaxInfo.fromJson(Map<String, dynamic> json) {
    return TaxInfo(
      taxRate: json['Taxrate'],
      vatRateInPercentage: json['VATRateInPercentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Taxrate': taxRate,
      'VATRateInPercentage': vatRateInPercentage,
    };
  }
}

class NutrientData {
  Calories calories;
  Kilojules kilojules;
  ServingSize servingSize;
  int numberOfServings;
  Interval numberOfServingIntervals;
  NetQuantity netQuantity;
  CaloriesPerServing caloriesPerServing;
  KilojulesPerServing kilojulesPerServing;
  Fat fat;
  SaturatedFattyAcids saturatedFattyAcids;
  Carbohydrates carbohydrates;
  Sugar sugar;
  Protein protein;
  Salt salt;

  NutrientData({
    required this.calories,
    required this.kilojules,
    required this.servingSize,
    required this.numberOfServings,
    required this.numberOfServingIntervals,
    required this.netQuantity,
    required this.caloriesPerServing,
    required this.kilojulesPerServing,
    required this.fat,
    required this.saturatedFattyAcids,
    required this.carbohydrates,
    required this.sugar,
    required this.protein,
    required this.salt,
  });

  factory NutrientData.fromJson(Map<String, dynamic> json) {
    return NutrientData(
      calories: Calories.fromJson(json['Calories']),
      kilojules: Kilojules.fromJson(json['Kilojules']),
      servingSize: ServingSize.fromJson(json['ServingSize']),
      numberOfServings: json['NumberofServings'],
      numberOfServingIntervals:
          Interval.fromJson(json['NumberofServingIntervals']),
      netQuantity: NetQuantity.fromJson(json['NetQuantity']),
      caloriesPerServing:
          CaloriesPerServing.fromJson(json['CaloriesperServing']),
      kilojulesPerServing:
          KilojulesPerServing.fromJson(json['KilojulesperServing']),
      fat: Fat.fromJson(json['Fat']),
      saturatedFattyAcids:
          SaturatedFattyAcids.fromJson(json['SaturatedFattyAcids']),
      carbohydrates: Carbohydrates.fromJson(json['Carbohydrates']),
      sugar: Sugar.fromJson(json['Sugar']),
      protein: Protein.fromJson(json['Protein']),
      salt: Salt.fromJson(json['Salt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Calories': calories.toJson(),
      'Kilojules': kilojules.toJson(),
      'ServingSize': servingSize.toJson(),
      'NumberofServings': numberOfServings,
      'NumberofServingIntervals': numberOfServingIntervals.toJson(),
      'NetQuantity': netQuantity.toJson(),
      'CaloriesperServing': caloriesPerServing.toJson(),
      'KilojulesperServing': kilojulesPerServing.toJson(),
      'Fat': fat.toJson(),
      'SaturatedFattyAcids': saturatedFattyAcids.toJson(),
      'Carbohydrates': carbohydrates.toJson(),
      'Sugar': sugar.toJson(),
      'Protein': protein.toJson(),
      'Salt': salt.toJson(),
    };
  }
}

class Calories {
  Interval energyInterval;
  int displayType;

  Calories({required this.energyInterval, required this.displayType});

  factory Calories.fromJson(Map<String, dynamic> json) {
    return Calories(
      energyInterval: Interval.fromJson(json['EnergyInterval']),
      displayType: json['DisplayType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'EnergyInterval': energyInterval.toJson(),
      'DisplayType': displayType,
    };
  }
}

class Kilojules {
  Interval energyInterval;
  int displayType;

  Kilojules({required this.energyInterval, required this.displayType});

  factory Kilojules.fromJson(Map<String, dynamic> json) {
    return Kilojules(
      energyInterval: Interval.fromJson(json['EnergyInterval']),
      displayType: json['DisplayType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'EnergyInterval': energyInterval.toJson(),
      'DisplayType': displayType,
    };
  }
}

class ServingSize {
  String? measurementType;
  WeightedInterval? weightedInterval;
  VolumenInterval? volumenInterval;
  CountInterval? countInterval;

  ServingSize({
    this.measurementType,
    this.weightedInterval,
    this.volumenInterval,
    this.countInterval,
  });

  factory ServingSize.fromJson(Map<String, dynamic> json) {
    return ServingSize(
      measurementType: json['MeasurementType'],
      weightedInterval: json['WeightedInterval'] != null
          ? WeightedInterval.fromJson(json['WeightedInterval'])
          : null,
      volumenInterval: json['VolumenInterval'] != null
          ? VolumenInterval.fromJson(json['VolumenInterval'])
          : null,
      countInterval: json['CountInterval'] != null
          ? CountInterval.fromJson(json['CountInterval'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'MeasurementType': measurementType,
      'WeightedInterval': weightedInterval?.toJson(),
      'VolumenInterval': volumenInterval?.toJson(),
      'CountInterval': countInterval?.toJson(),
    };
  }
}

class Interval {
  int lower;
  int upper;

  Interval({required this.lower, required this.upper});

  factory Interval.fromJson(Map<String, dynamic> json) {
    return Interval(
      lower: json['Lower'],
      upper: json['Upper'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Lower': lower,
      'Upper': upper,
    };
  }
}

class NetQuantity {
  String measurementType;
  WeightedInterval weightedInterval;
  VolumenInterval volumenInterval;
  CountInterval countInterval;

  NetQuantity({
    required this.measurementType,
    required this.weightedInterval,
    required this.volumenInterval,
    required this.countInterval,
  });

  factory NetQuantity.fromJson(Map<String, dynamic> json) {
    return NetQuantity(
      measurementType: json['MeasurementType'],
      weightedInterval: WeightedInterval.fromJson(json['WeightedInterval']),
      volumenInterval: VolumenInterval.fromJson(json['VolumenInterval']),
      countInterval: CountInterval.fromJson(json['CountInterval']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'MeasurementType': measurementType,
      'WeightedInterval': weightedInterval.toJson(),
      'VolumenInterval': volumenInterval.toJson(),
      'CountInterval': countInterval.toJson(),
    };
  }
}

class WeightedInterval {
  Interval interval;
  Weight weight;

  WeightedInterval({required this.interval, required this.weight});

  factory WeightedInterval.fromJson(Map<String, dynamic> json) {
    return WeightedInterval(
      interval: Interval.fromJson(json['Interval']),
      weight: Weight.fromJson(json['Weight']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Interval': interval.toJson(),
      'Weight': weight.toJson(),
    };
  }
}

class Weight {
  String unitType;

  Weight({required this.unitType});

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(unitType: json['UnitType']);
  }

  Map<String, dynamic> toJson() {
    return {'UnitType': unitType};
  }
}

class VolumenInterval {
  Interval interval;
  Volume volume;

  VolumenInterval({required this.interval, required this.volume});

  factory VolumenInterval.fromJson(Map<String, dynamic> json) {
    return VolumenInterval(
      interval: Interval.fromJson(json['Interval']),
      volume: Volume.fromJson(json['Volume']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Interval': interval.toJson(),
      'Volume': volume.toJson(),
    };
  }
}

class Volume {
  String unitType;

  Volume({required this.unitType});

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(unitType: json['UnitType']);
  }

  Map<String, dynamic> toJson() {
    return {'UnitType': unitType};
  }
}

class CountInterval {
  Interval interval;
  Count count;

  CountInterval({required this.interval, required this.count});

  factory CountInterval.fromJson(Map<String, dynamic> json) {
    return CountInterval(
      interval: Interval.fromJson(json['Interval']),
      count: Count.fromJson(json['Count']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Interval': interval.toJson(),
      'Count': count.toJson(),
    };
  }
}

class Count {
  String unitType;

  Count({required this.unitType});

  factory Count.fromJson(Map<String, dynamic> json) {
    return Count(unitType: json['UnitType']);
  }

  Map<String, dynamic> toJson() {
    return {'UnitType': unitType};
  }
}

class CaloriesPerServing {
  Interval energyInterval;
  int displayType;

  CaloriesPerServing({required this.energyInterval, required this.displayType});

  factory CaloriesPerServing.fromJson(Map<String, dynamic> json) {
    return CaloriesPerServing(
      energyInterval: Interval.fromJson(json['EnergyInterval']),
      displayType: json['DisplayType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'EnergyInterval': energyInterval.toJson(),
      'DisplayType': displayType,
    };
  }
}

class KilojulesPerServing {
  Interval energyInterval;
  int displayType;

  KilojulesPerServing(
      {required this.energyInterval, required this.displayType});

  factory KilojulesPerServing.fromJson(Map<String, dynamic> json) {
    return KilojulesPerServing(
      energyInterval: Interval.fromJson(json['EnergyInterval']),
      displayType: json['DisplayType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'EnergyInterval': energyInterval.toJson(),
      'DisplayType': displayType,
    };
  }
}

class Fat {
  Amount? amount;

  Fat({this.amount});

  factory Fat.fromJson(Map<String, dynamic> json) {
    return Fat(
      amount: json['Amount'] != null ? Amount.fromJson(json['Amount']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'Amount': amount?.toJson()};
  }
}

class Amount {
  Interval? interval;
  Weight? weight;

  Amount({this.interval, this.weight});

  factory Amount.fromJson(Map<String, dynamic> json) {
    return Amount(
      interval:
          json['Interval'] != null ? Interval.fromJson(json['Interval']) : null,
      weight: json['Weight'] != null ? Weight.fromJson(json['Weight']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Interval': interval?.toJson(),
      'Weight': weight?.toJson(),
    };
  }
}

class SaturatedFattyAcids {
  Amount? amount;

  SaturatedFattyAcids({this.amount});

  factory SaturatedFattyAcids.fromJson(Map<String, dynamic> json) {
    return SaturatedFattyAcids(
      amount: json['Amount'] != null ? Amount.fromJson(json['Amount']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'Amount': amount?.toJson()};
  }
}

class Carbohydrates {
  Amount? amount;

  Carbohydrates({this.amount});

  factory Carbohydrates.fromJson(Map<String, dynamic> json) {
    return Carbohydrates(
      amount: json['Amount'] != null ? Amount.fromJson(json['Amount']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'Amount': amount?.toJson()};
  }
}

class Sugar {
  Amount amount;

  Sugar({required this.amount});

  factory Sugar.fromJson(Map<String, dynamic> json) {
    return Sugar(amount: Amount.fromJson(json['Amount']));
  }

  Map<String, dynamic> toJson() {
    return {'Amount': amount.toJson()};
  }
}

class Protein {
  Amount amount;

  Protein({required this.amount});

  factory Protein.fromJson(Map<String, dynamic> json) {
    return Protein(amount: Amount.fromJson(json['Amount']));
  }

  Map<String, dynamic> toJson() {
    return {'Amount': amount.toJson()};
  }
}

class Salt {
  Amount amount;

  Salt({required this.amount});

  factory Salt.fromJson(Map<String, dynamic> json) {
    return Salt(amount: Amount.fromJson(json['Amount']));
  }

  Map<String, dynamic> toJson() {
    return {'Amount': amount.toJson()};
  }
}

class DishInfo {
  Classifications? classifications;
  String? instructionsForUse;
  List<dynamic>? ingredients;
  List<dynamic>? additives;
  String? preparationType;
  FoolBusinessOperator? foolBusinessOperator;

  bool? isHighFatSaltSugar;
  bool? isHalal;
  int? spiceLevel;

  DishInfo({
    this.classifications,
    this.instructionsForUse,
    this.ingredients,
    this.additives,
    this.preparationType,
    this.foolBusinessOperator,
    this.isHighFatSaltSugar,
    this.isHalal,
    this.spiceLevel,
  });

  factory DishInfo.fromJson(Map<String, dynamic> json) {
    return DishInfo(
      classifications: json['Classifications'] != null
          ? Classifications.fromJson(json['Classifications'])
          : null,
      instructionsForUse: json['InstructionsForUse'] as String?,
      ingredients: json['Ingredients'] != null
          ? List<dynamic>.from(json['Ingredients'])
          : null,
      additives: json['Additives'] != null
          ? List<dynamic>.from(json['Additives'])
          : null,
      preparationType: json['PreparationType'] as String?,
      foolBusinessOperator: json['FoolBusinessOperator'] != null
          ? FoolBusinessOperator.fromJson(json['FoolBusinessOperator'])
          : null,
      isHighFatSaltSugar: json['IsHighFatSaltSugar'] as bool?,
      isHalal: json['IsHalal'] as bool?,
      spiceLevel: json['SpiceLevel'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Classifications': classifications?.toJson(),
      'InstructionsForUse': instructionsForUse,
      'Ingredients': ingredients,
      'Additives': additives,
      'PreparationType': preparationType,
      'FoolBusinessOperator': foolBusinessOperator?.toJson(),
      'IsHighFatSaltSugar': isHighFatSaltSugar,
      'IsHalal': isHalal,
      'SpiceLevel': spiceLevel,
    };
  }
}

class Classifications {
  bool canServeAlone;
  bool isVegetarian;
  int alcoholicItem;
  dynamic dietaryLabelInfo;

  Classifications({
    required this.canServeAlone,
    required this.isVegetarian,
    required this.alcoholicItem,
    required this.dietaryLabelInfo,
  });

  factory Classifications.fromJson(Map<String, dynamic> json) {
    return Classifications(
      canServeAlone: json['CanServeAlone'],
      isVegetarian: json['IsVegetarian'],
      alcoholicItem: json['AlcoholicItem'],
      dietaryLabelInfo: json['DietaryLabelInfo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CanServeAlone': canServeAlone,
      'IsVegetarian': isVegetarian,
      'AlcoholicItem': alcoholicItem,
      'DietaryLabelInfo': dietaryLabelInfo,
    };
  }
}

class FoolBusinessOperator {
  String name;
  String address;

  FoolBusinessOperator({required this.name, required this.address});

  factory FoolBusinessOperator.fromJson(Map<String, dynamic> json) {
    return FoolBusinessOperator(
      name: json['Name'],
      address: json['Address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Address': address,
    };
  }
}

class VisibilityInfo {
  String? startDate;
  String? endDate;
  List<dynamic>? hoursOfWeek;

  VisibilityInfo({
    this.startDate,
    this.endDate,
    this.hoursOfWeek,
  });

  factory VisibilityInfo.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic>? visibilityHours = json['VisibilityHours'];

    return VisibilityInfo(
      startDate: visibilityHours?['StartDate'] as String?,
      endDate: visibilityHours?['EndDate'] as String?,
      hoursOfWeek: visibilityHours?['HoursofWeek'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'VisibilityHours': {
        'StartDate': startDate,
        'EndDate': endDate,
        'HoursofWeek': hoursOfWeek,
      },
    };
  }
}

class ProductInfo {
  int targetMarket;
  String gtin;
  String plu;
  String merchantID;
  String productType;
  dynamic productTraits;
  dynamic countriesOfOrigin;

  ProductInfo({
    required this.targetMarket,
    required this.gtin,
    required this.plu,
    required this.merchantID,
    required this.productType,
    required this.productTraits,
    required this.countriesOfOrigin,
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json) {
    return ProductInfo(
      targetMarket: json['TargetMarket'],
      gtin: json['Gtin'],
      plu: json['Plu'],
      merchantID: json['MerchantID'],
      productType: json['ProductType'],
      productTraits: json['ProductTraits'],
      countriesOfOrigin: json['CountriesofOrigin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'TargetMarket': targetMarket,
      'Gtin': gtin,
      'Plu': plu,
      'MerchantID': merchantID,
      'ProductType': productType,
      'ProductTraits': productTraits,
      'CountriesofOrigin': countriesOfOrigin,
    };
  }
}

class MetaData {
  String? dealProductID;
  bool? isDealProduct;
  String productID;
  String productName;
  String unitChartID;
  String unitChartName;

  MetaData({
    required this.dealProductID,
    required this.isDealProduct,
    required this.productID,
    required this.productName,
    required this.unitChartID,
    required this.unitChartName,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      dealProductID: json['DealProductID'] as String?,
      isDealProduct: json['IsDealProduct'] as bool?,
      productID: json['ProductID'],
      productName: json['ProductName'],
      unitChartID: json['UnitChartID'],
      unitChartName: json['UnitChartName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'DealProductID': dealProductID,
      'IsDealProduct': isDealProduct,
      'ProductID': productID,
      'ProductName': productName,
      'UnitChartID': unitChartID,
      'UnitChartName': unitChartName,
    };
  }
}

class BeverageInfo {
  int caffeineAmount;
  int alcoholByVolume;
  CoffeeInfo coffeeInfo;

  BeverageInfo({
    required this.caffeineAmount,
    required this.alcoholByVolume,
    required this.coffeeInfo,
  });

  factory BeverageInfo.fromJson(Map<String, dynamic> json) {
    return BeverageInfo(
      caffeineAmount: json['CaffeineAmount'],
      alcoholByVolume: json['AlcoholbyVolume'],
      coffeeInfo: CoffeeInfo.fromJson(json['CoffeeInfo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CaffeineAmount': caffeineAmount,
      'AlcoholbyVolume': alcoholByVolume,
      'CoffeeInfo': coffeeInfo.toJson(),
    };
  }
}

class CoffeeInfo {
  dynamic coffeeBeanOrigin;

  CoffeeInfo({this.coffeeBeanOrigin});

  factory CoffeeInfo.fromJson(Map<String, dynamic> json) {
    return CoffeeInfo(coffeeBeanOrigin: json['CoffeeBeanOrigin']);
  }

  Map<String, dynamic> toJson() {
    return {'CoffeeBeanOrigin': coffeeBeanOrigin};
  }
}
