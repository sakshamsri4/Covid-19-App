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
    //for (int i = 0; i < 4; i++) print(TotalDeathRecoveryActive[i]);
    //List<int> TotalDeathRecoveryActive = [total, death, recovery, active];
    //List<int> TotalDeathRecoveryActive = [1, 2, 3, 4];
    int a = 6;
    return total;
  }

  void setIndiaData(int t, int d, int r, int a) {
    //if (DeathRecoveryActive == null) DeathRecoveryActive = List<int>();
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
