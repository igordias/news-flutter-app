import 'package:flutter/material.dart';

enum Category {
  BUSINESS,
  ENTERTAINMENT,
  GENERAL,
  HEALTH,
  SCIENCE,
  SPORTS,
  TECHNOLOGY
}

extension Categories on Category {
  static const String _NAMED_BUSINESS = "business";
  static const String _NAMED_ENTERTAINMENT = "entertainment";
  static const String _NAMED_GENERAL = "general";
  static const String _NAMED_HEALTH = "health";
  static const String _NAMED_SCIENCE = "science";
  static const String _NAMED_SPORTS = "sports";
  static const String _NAMED_TECHNOLOGY = "technology";

  static Map<Category, String> getAll() {
    return {
      Category.BUSINESS: _NAMED_BUSINESS,
      Category.ENTERTAINMENT: _NAMED_ENTERTAINMENT,
      Category.GENERAL: _NAMED_GENERAL,
      Category.HEALTH: _NAMED_HEALTH,
      Category.SCIENCE: _NAMED_SCIENCE,
      Category.SPORTS: _NAMED_SPORTS,
      Category.TECHNOLOGY: _NAMED_TECHNOLOGY,
    };
  }
}
