enum Category {
  latest,
  business,
  entertainment,
  general,
  health,
  science,
  sports,
  technology,
}

extension CategoryExtension on Category {
  String get label {
    switch (this) {
      case Category.latest:
        return 'LATEST';
      case Category.business:
        return 'BUSINESS';
      case Category.entertainment:
        return 'ENTERTAINMENT';
      case Category.general:
        return 'GENERAL';
      case Category.health:
        return 'HEALTH';
      case Category.science:
        return 'SCIENCE';
      case Category.sports:
        return 'SPORTS';
      case Category.technology:
        return 'TECHNOLOGY';
      default:
        return '';
    }
  }

  String get query {
    switch (this) {
      case Category.latest:
        return '';
      case Category.business:
        return 'business';
      case Category.entertainment:
        return 'entertainment';
      case Category.general:
        return 'general';
      case Category.health:
        return 'health';
      case Category.science:
        return 'science';
      case Category.sports:
        return 'sports';
      case Category.technology:
        return 'technology';
      default:
        return '';
    }
  }

  static Category fromIntToType(int type) {
    switch (type) {
      case 1:
        return Category.latest;
      case 2:
        return Category.business;
      case 3:
        return Category.entertainment;
      case 4:
        return Category.general;
      case 5:
        return Category.health;
      case 6:
        return Category.science;
      case 7:
        return Category.sports;
      case 8:
        return Category.technology;
      default:
        return Category.latest;
    }
  }
}
