class SData {
  SData._privateConstructor();

  static SData _ob = SData._privateConstructor();
  List<states> data = [];

  static SData getInstance() {
    return _ob;
  }

  void setSData(states ob) {
    if (data.length == 0) {
      data = [ob];
    } else
      data.add(ob);
  }

  List<states> getSData() {
    return data;
  }
}

class states {
  int active, death, reovered, total;
  String region;
  states({this.total, this.death, this.reovered, this.active, this.region});
}
