class Landlord {
  final String id;
  final String name;
  final String phone;
  final bool isVerified;
  final String trustSummary;
  final double rating;
  final int reviewCount;
  final DateTime joinedAt;
  final String? avatarUrl;

  const Landlord({
    required this.id,
    required this.name,
    required this.phone,
    required this.isVerified,
    required this.trustSummary,
    required this.rating,
    required this.reviewCount,
    required this.joinedAt,
    this.avatarUrl,
  });

  // Creates a [Landlord] from a map/JSON object
  factory Landlord.fromMap(Map<String, dynamic> map) {
    return Landlord(
      id: map['id'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String,
      isVerified: map['isVerified'] as bool? ?? false,
      trustSummary: map['trustSummary'] as String? ?? '',
      rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: (map['reviewCount'] as num?)?.toInt() ?? 0,
      joinedAt: map['joinedAt'] is DateTime
          ? map['joinedAt'] as DateTime
          : DateTime.parse(map['joinedAt'] as String),
      avatarUrl: map['avatarUrl'] as String?,
    );
  }

  // Converts this [Landlord] into a map/JSON object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'isVerified': isVerified,
      'trustSummary': trustSummary,
      'rating': rating,
      'reviewCount': reviewCount,
      'joinedAt': joinedAt.toIso8601String(),
      'avatarUrl': avatarUrl,
    };
  }

  // Returns a copy of this [Landlord] with any provided fields replaced
  Landlord copyWith({
    String? id,
    String? name,
    String? phone,
    bool? isVerified,
    String? trustSummary,
    double? rating,
    int? reviewCount,
    DateTime? joinedAt,
    String? avatarUrl,
  }) {
    return Landlord(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      isVerified: isVerified ?? this.isVerified,
      trustSummary: trustSummary ?? this.trustSummary,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      joinedAt: joinedAt ?? this.joinedAt,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Landlord &&
        other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.isVerified == isVerified &&
        other.trustSummary == trustSummary &&
        other.rating == rating &&
        other.reviewCount == reviewCount &&
        other.joinedAt == joinedAt &&
        other.avatarUrl == avatarUrl;
  }

  @override
  int get hashCode => Object.hash(
        id,
        name,
        phone,
        isVerified,
        trustSummary,
        rating,
        reviewCount,
        joinedAt,
        avatarUrl,
      );
}