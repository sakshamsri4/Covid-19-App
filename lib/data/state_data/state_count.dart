class StateCount {
  StateCount._privateConstructor();
  static StateCount _ob = StateCount._privateConstructor();
  static int data = 0;

  static StateCount getInstance() {
    return _ob;
  }

  void setIData(int v) {
    data = v;
  }

  int getIData() {
    return data;
  }
}
