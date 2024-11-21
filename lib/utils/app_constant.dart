class AppConstant {
  static final AppConstant instance = AppConstant._();
  AppConstant._();

  final view = _View.instance;
  final config = _Configuration.instance;
  final data = _Data.instance;
}

class _Configuration {
  static final _Configuration instance = _Configuration._();
  _Configuration._();

  String get baseUrl => '';
  String get bongkertsolutionUrl => 'https://bongkert.com';
}

class _View {
  static final _View instance = _View._();
  _View._();

  // MARK: General -------------------------
  double get defaultBottomTabbarHeight => 55;
  double get defaultInputSectionHeight => 50;
  double get defaultTabBarHeight => 35;
  double get defaultButtonSize => 55;
  double get defaultSectionTitleHeight => 45;

  double get standardSpacing => 16.0;
  double get borderRadius => 12.0;

  // MARK: AspectRatio -------------------------
  double get videoAspectRatio => 16 / 9;
  double get imageAspectRatio => 16 / 9;
  double get imageSectionAspectRatio => 1 / 0.6;
}

class _Data {
  static final _Data instance = _Data._();
  _Data._();

  // MARK: House Visit Time
  final List<String> times = [
    "8:00AM",
    "9:00AM",
    "10:00AM",
    "11:00AM",
    "12:00PM",
    "1:00PM",
    "2:00PM",
    "3:00PM",
    "4:00PM",
    "5:00PM"
  ];
}
