class IData {
  IData._privateConstructor();
  static IData _ob = IData._privateConstructor();
  List<int> data = [];

  static IData getInstance() {
    return _ob;
  }

  void setIData(int t, int d, int r, int a) {
    if (data.length == 0) {
      data = [t, d, r, a];
    }
  }

  List<int> getIData() {
    return data;
  }
}
