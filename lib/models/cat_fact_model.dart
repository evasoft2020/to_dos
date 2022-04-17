import 'dart:convert';

class CatFactModel {
  final String fact;
  final int length;

  CatFactModel(
    this.fact,
    this.length,
  );

  CatFactModel copyWith({
    String? fact,
    int? length,
  }) {
    return CatFactModel(
      fact ?? this.fact,
      length ?? this.length,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'fact': fact});
    result.addAll({'length': length});

    return result;
  }

  factory CatFactModel.fromMap(Map<String, dynamic> map) {
    return CatFactModel(
      map['fact'] ?? '',
      map['length']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatFactModel.fromJson(String source) =>
      CatFactModel.fromMap(json.decode(source));

  @override
  String toString() => 'CatFactModel(fact: $fact, length: $length)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CatFactModel &&
        other.fact == fact &&
        other.length == length;
  }

  @override
  int get hashCode => fact.hashCode ^ length.hashCode;
}
