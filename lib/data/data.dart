final prevention = [
  {'assets/images/distance.png': 'Avoid close\ncontact'},
  {'assets/images/wash_hands.png': 'Clean your\nhands often'},
  {'assets/images/mask.png': 'Wear a\nfacemask'},
];

class IndiaData {
  //int death,recovery,active;
  static List<int> TotalDeathRecoveryActive = [];
  static List<int> getIndiaData() {
    //for (int i = 0; i < 4; i++) print(TotalDeathRecoveryActive[i]);

    print("India");
    return TotalDeathRecoveryActive;
  }

  static void setIndiaData(int t, int d, int r, int a) {
    //if (DeathRecoveryActive == null) DeathRecoveryActive = List<int>();
    TotalDeathRecoveryActive.add(t);
    TotalDeathRecoveryActive.add(d);
    TotalDeathRecoveryActive.add(r);
    TotalDeathRecoveryActive.add(a);
  }
}

class GlobalData {
  //int death,recovery,active;
  static List<int> TotalDeathRecoveryActive = [];
  static List<int> getGlobalData() {
    print("Global");
    return TotalDeathRecoveryActive;
  }

  static void setGlobalData(int t, int d, int r, int a) {
    TotalDeathRecoveryActive.add(t);
    TotalDeathRecoveryActive.add(d);
    TotalDeathRecoveryActive.add(r);
    TotalDeathRecoveryActive.add(a);
  }
}
