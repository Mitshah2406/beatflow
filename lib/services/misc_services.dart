class MiscServices {
  static get getCurrentTime {
    DateTime now = DateTime.now();
    if (now.hour >= 0 && now.hour <= 11) {
      return "Morning";
    } else if (now.hour >= 12 && now.hour <= 15) {
      return "Afternoon";
    } else if (now.hour >= 16 && now.hour <= 19) {
      return "Evening";
    } else if (now.hour >= 20 && now.hour <= 23) {
      return "Night";
    }
  }
}
