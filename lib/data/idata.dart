class IData {
  static IData ob;
  List<int> data;
  IData() {
    data = [];
  }
  static IData getObject() {
    if (ob == null) ob = new IData();
    return ob;
  }

  void setIData(int t, int d, int r, int a) {
    data.add(t);
    data.add(d);
    data.add(r);
    data.add(a);
  }

  List<int> getIData() {
    return data;
  }
}
