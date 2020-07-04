class GData {
  GData._privateConstructor();
  static GData _ob = GData._privateConstructor();
  List<int> data = [];

  static GData getInstance() {
    return _ob;
  }

  void setGData(int t, int d, int r, int a) {
    if (data.length == 0) {
      data = [t, d, r, a];
//      data.add(t);
//      data.add(d);
//      data.add(r);
//      data.add(a);
    }
  }

  List<int> getGData() {
    return data;
  }
}
