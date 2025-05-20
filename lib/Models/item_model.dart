class ItemModel {
  final List<Banner> bannerOne;
  final List<Category> category;
  final List<Product> products;
  final List<Banner> bannerTwo;
  final List<NewArrival> newArrivals;
  final List<Banner> bannerThree;
  final List<Categories> categoriesListing;
  final List<String> topBrands;
  final List<NewArrival> brandListing;
  final List<Product> unboxedDeals;

  ItemModel({
    required this.bannerOne,
    required this.category,
    required this.products,
    required this.bannerTwo,
    required this.newArrivals,
    required this.bannerThree,
    required this.categoriesListing,
    required this.topBrands,
    required this.brandListing,
    required this.unboxedDeals,
  });

  ItemModel.fromJson(Map<String, dynamic> json)
    : bannerOne =
          ((json['banner_one'] ?? []) as List)
              .map((e) => Banner.fromJson(e))
              .toList(),
      category =
          ((json['category'] ?? []) as List)
              .map((e) => Category.fromJson(e))
              .toList(),
      products =
          ((json['products'] ?? []) as List)
              .map((e) => Product.fromJson(e))
              .toList(),
      bannerTwo =
          ((json['banner_two'] ?? []) as List)
              .map((e) => Banner.fromJson(e))
              .toList(),
      newArrivals =
          ((json['new_arrivals'] ?? []) as List)
              .map((e) => NewArrival.fromJson(e))
              .toList(),
      bannerThree =
          ((json['banner_three'] ?? []) as List)
              .map((e) => Banner.fromJson(e))
              .toList(),
      categoriesListing =
          ((json['categories_listing'] ?? []) as List)
              .map((e) => Categories.fromJson(e))
              .toList(),
      topBrands =
          ((json['top_brands'] ?? []) as List)
              .map((e) => e["icon"].toString())
              .toList(),
      brandListing =
          ((json['brand_listing'] ?? []) as List)
              .map((e) => NewArrival.fromJson(e))
              .toList(),
      unboxedDeals =
          ((json['unboxed_deals'] ?? []) as List)
              .map((e) => Product.fromJson(e))
              .toList();
  // Default empty model
  static final defaultmodel = ItemModel(
    bannerOne: [],
    bannerThree: [],
    bannerTwo: [],
    brandListing: [],
    categoriesListing: [],
    category: [],
    newArrivals: [],
    products: [],
    topBrands: [],
    unboxedDeals: [],
  );
}

// Banner Model
class Banner {
  final String image;

  Banner({required this.image});

  Banner.fromJson(Map<String, dynamic> json) : image = json['banner'] ?? '';
}

// Category Model
class Category {
  final String label;
  final String icon;

  Category({required this.label, required this.icon});

  Category.fromJson(Map<String, dynamic> json)
    : label = json['label'] ?? '',
      icon = json['icon'] ?? '';
}

// Product Model
class Product {
  final String icon;
  final String offer;
  final String label;
  final String subLabel;

  Product({
    required this.icon,
    required this.offer,
    required this.label,
    this.subLabel = "",
  });
  Product.fromJson(Map<String, dynamic> json)
    : icon = json['icon'] ?? '',
      offer = json['offer'] ?? '',
      label = json['label'] ?? '',
      subLabel = json['SubLabel'] ?? '';
}

// New Arrival Model
class NewArrival {
  final String icon;
  final String offer;
  final String brandIcon;
  final String label;

  NewArrival({
    required this.icon,
    required this.offer,
    required this.brandIcon,
    required this.label,
  });
  NewArrival.fromJson(Map<String, dynamic> json)
    : icon = json['icon'] ?? '',
      offer = json['offer'] ?? '',
      brandIcon = json['brandIcon'] ?? '',
      label = json['label'] ?? '';
}

// Product Model
class Categories {
  final String icon;
  final String offer;
  final String label;

  Categories({required this.icon, required this.offer, required this.label});
  Categories.fromJson(Map<String, dynamic> json)
    : icon = json['icon'] ?? '',
      offer = json['offer'] ?? '',
      label = json['label'] ?? '';
}
