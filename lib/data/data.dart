final prevention = [
  {'assets/images/distance.png': 'Avoid close\ncontact'},
  {'assets/images/wash_hands.png': 'Clean your\nhands often'},
  {'assets/images/mask.png': 'Wear a\nfacemask'},
];

class IndiaData {
  //int death,recovery,active;
  static int total;
  static int death;
  static int recovery;
  static int active;

  int getIndiaData() {
    return total;
  }

  void setIndiaData(int t, int d, int r, int a) {
    total = t;
    death = d;
    recovery = r;
    active = a;
  }

  void display() {
    print(total);
    print(death);
    print(recovery);
    print(active);
  }
}

class GlobalData {
  //int death,recovery,active;
  static List<int> TotalDeathRecoveryActive = [];
  static List<int> getGlobalData() {
    return TotalDeathRecoveryActive;
  }

  static void setGlobalData(int t, int d, int r, int a) {
    TotalDeathRecoveryActive.add(t);
    TotalDeathRecoveryActive.add(d);
    TotalDeathRecoveryActive.add(r);
    TotalDeathRecoveryActive.add(a);
  }
}
