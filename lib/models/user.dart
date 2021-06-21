class Useraa {
  String name;
  double money;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Useraa({
    required this.name,
    required this.money,
  });

  Useraa copyWith({
    required String name,
    required double money,
  }) {
    return new Useraa(
      name: name,
      money: money,
    );
  }

  @override
  String toString() {
    return 'User{name: $name, money: $money}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Useraa &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          money == other.money);

  @override
  int get hashCode => name.hashCode ^ money.hashCode;

  factory Useraa.fromMap(Map<String, dynamic> map) {
    return new Useraa(
      name: map['name'] as String,
      money: map['money'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'money': this.money,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
