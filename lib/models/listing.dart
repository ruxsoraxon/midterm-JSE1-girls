import 'package:flutter/foundation.dart';

class Listing {
  final String id;
  final String landlordId;
  final String title;
  final String description;
  final String district;
  final String address;
  final int monthlyRentUsd;
  final int roomCount;
  final String propertyType;
  final List<String> amenities;
  final List<String> photoUrls;
  final bool isAvailable;
  final DateTime createdAt;
  final double? distanceKm; // optional

  // Creates a [Listing] instance
  const Listing({
    required this.id,
    required this.landlordId,
    required this.title,
    required this.description,
    required this.district,
    required this.address,
    required this.monthlyRentUsd,
    required this.roomCount,
    required this.propertyType,
    required this.amenities,
    required this.photoUrls,
    required this.isAvailable,
    required this.createdAt,
    this.distanceKm,
  });

  // Creates a [Listing] from a map/JSON object
  factory Listing.fromMap(Map<String, dynamic> map) {
    return Listing(
      id: map['id'] as String,
      landlordId: map['landlordId'] as String,
      title: map['title'] as String,
      description: map['description'] as String? ?? '',
      district: map['district'] as String,
      address: map['address'] as String? ?? '',
      monthlyRentUsd: (map['monthlyRentUsd'] as num).toInt(),
      roomCount: (map['roomCount'] as num).toInt(),
      propertyType: map['propertyType'] as String? ?? 'Apartment',
      amenities: List<String>.from(map['amenities'] as List? ?? const []),
      photoUrls: List<String>.from(map['photoUrls'] as List? ?? const []),
      isAvailable: map['isAvailable'] as bool? ?? true,
      createdAt: map['createdAt'] is DateTime
          ? map['createdAt'] as DateTime
          : DateTime.parse(map['createdAt'] as String),
      distanceKm: (map['distanceKm'] as num?)?.toDouble(),
    );
  }

  // Converts this [Listing] into a map/JSON object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'landlordId': landlordId,
      'title': title,
      'description': description,
      'district': district,
      'address': address,
      'monthlyRentUsd': monthlyRentUsd,
      'roomCount': roomCount,
      'propertyType': propertyType,
      'amenities': amenities,
      'photoUrls': photoUrls,
      'isAvailable': isAvailable,
      'createdAt': createdAt.toIso8601String(),
      'distanceKm': distanceKm,
    };
  }

  // Returns a copy of this [Listing] with any provided fields replaced
  Listing copyWith({
    String? id,
    String? landlordId,
    String? title,
    String? description,
    String? district,
    String? address,
    int? monthlyRentUsd,
    int? roomCount,
    String? propertyType,
    List<String>? amenities,
    List<String>? photoUrls,
    bool? isAvailable,
    DateTime? createdAt,
    double? distanceKm,
  }) {
    return Listing(
      id: id ?? this.id,
      landlordId: landlordId ?? this.landlordId,
      title: title ?? this.title,
      description: description ?? this.description,
      district: district ?? this.district,
      address: address ?? this.address,
      monthlyRentUsd: monthlyRentUsd ?? this.monthlyRentUsd,
      roomCount: roomCount ?? this.roomCount,
      propertyType: propertyType ?? this.propertyType,
      amenities: amenities ?? this.amenities,
      photoUrls: photoUrls ?? this.photoUrls,
      isAvailable: isAvailable ?? this.isAvailable,
      createdAt: createdAt ?? this.createdAt,
      distanceKm: distanceKm ?? this.distanceKm,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Listing &&
        other.id == id &&
        other.landlordId == landlordId &&
        other.title == title &&
        other.description == description &&
        other.district == district &&
        other.address == address &&
        other.monthlyRentUsd == monthlyRentUsd &&
        other.roomCount == roomCount &&
        other.propertyType == propertyType &&
        listEquals(other.amenities, amenities) &&
        listEquals(other.photoUrls, photoUrls) &&
        other.isAvailable == isAvailable &&
        other.createdAt == createdAt &&
        other.distanceKm == distanceKm;
  }

  @override
  int get hashCode => Object.hash(
        id,
        landlordId,
        title,
        description,
        district,
        address,
        monthlyRentUsd,
        roomCount,
        propertyType,
        Object.hashAll(amenities),
        Object.hashAll(photoUrls),
        isAvailable,
        createdAt,
        distanceKm,
      );
}