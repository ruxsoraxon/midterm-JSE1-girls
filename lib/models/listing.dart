import 'package:flutter/foundation.dart';

enum ListingAudience {
  studentsWelcome('Students welcome'),

  girls('Girls'),

  boys('Boys');

  final String label;

  const ListingAudience(this.label);

  static ListingAudience fromString(String? value) {
    switch (value?.trim().toLowerCase()) {
      case 'girls':
        return ListingAudience.girls;
      case 'boys':
        return ListingAudience.boys;
      case 'students welcome':
      case 'studentswelcome':
      default:
        return ListingAudience.studentsWelcome;
    }
  }
}

class Listing {
  final String id;
  final String landlordId;
  final String title;
  final String description;
  final String district;
  final String address;
  final int monthlyRentUzs;
  final int roomCount;
  final String propertyType;
  final List<String> amenities;
  final List<String> photoUrls;
  final bool isAvailable;
  final DateTime createdAt;
  final double latitude;
  final double longitude;
  final ListingAudience forWhom;

  const Listing({
    required this.id,
    required this.landlordId,
    required this.title,
    required this.description,
    required this.district,
    required this.address,
    required this.monthlyRentUzs,
    required this.roomCount,
    required this.propertyType,
    required this.amenities,
    required this.photoUrls,
    required this.isAvailable,
    required this.createdAt,
    required this.latitude,
    required this.longitude,
    this.forWhom = ListingAudience.studentsWelcome,  
  });

  factory Listing.fromMap(Map<String, dynamic> map) {
    return Listing(
      id: map['id'] as String,
      landlordId: map['landlordId'] as String,
      title: map['title'] as String,
      description: map['description'] as String? ?? '',
      district: map['district'] as String,
      address: map['address'] as String? ?? '',
      monthlyRentUzs: (map['monthlyRentUzs'] as num).toInt(),
      roomCount: (map['roomCount'] as num).toInt(),
      propertyType: map['propertyType'] as String? ?? 'Apartment',
      amenities: List<String>.from(map['amenities'] as List? ?? const []),
      photoUrls: List<String>.from(map['photoUrls'] as List? ?? const []),
      isAvailable: map['isAvailable'] as bool? ?? true,
      createdAt: map['createdAt'] is DateTime
          ? map['createdAt'] as DateTime
          : DateTime.parse(map['createdAt'] as String),
      latitude: (map['latitude'] as num).toDouble(),
      longitude: (map['longitude'] as num).toDouble(),
      forWhom: ListingAudience.fromString(map['forWhom'] as String?),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'landlordId': landlordId,
      'title': title,
      'description': description,
      'district': district,
      'address': address,
      'monthlyRentUzs': monthlyRentUzs,
      'roomCount': roomCount,
      'propertyType': propertyType,
      'amenities': amenities,
      'photoUrls': photoUrls,
      'isAvailable': isAvailable,
      'createdAt': createdAt.toIso8601String(),
      'latitude': latitude,
      'longitude': longitude,
      'forWhom': forWhom.label, 
    };
  }

  Listing copyWith({
    String? id,
    String? landlordId,
    String? title,
    String? description,
    String? district,
    String? address,
    int? monthlyRentUzs,
    int? roomCount,
    String? propertyType,
    List<String>? amenities,
    List<String>? photoUrls,
    bool? isAvailable,
    DateTime? createdAt,
    double? latitude,
    double? longitude,
    ListingAudience? forWhom,
  }) {
    return Listing(
      id: id ?? this.id,
      landlordId: landlordId ?? this.landlordId,
      title: title ?? this.title,
      description: description ?? this.description,
      district: district ?? this.district,
      address: address ?? this.address,
      monthlyRentUzs: monthlyRentUzs ?? this.monthlyRentUzs,
      roomCount: roomCount ?? this.roomCount,
      propertyType: propertyType ?? this.propertyType,
      amenities: amenities ?? this.amenities,
      photoUrls: photoUrls ?? this.photoUrls,
      isAvailable: isAvailable ?? this.isAvailable,
      createdAt: createdAt ?? this.createdAt,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      forWhom: forWhom ?? this.forWhom,
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
        other.monthlyRentUzs == monthlyRentUzs &&
        other.roomCount == roomCount &&
        other.propertyType == propertyType &&
        listEquals(other.amenities, amenities) &&
        listEquals(other.photoUrls, photoUrls) &&
        other.isAvailable == isAvailable &&
        other.createdAt == createdAt &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.forWhom == forWhom;
  }

  @override
  int get hashCode => Object.hash(
        id,
        landlordId,
        title,
        description,
        district,
        address,
        monthlyRentUzs,
        roomCount,
        propertyType,
        Object.hashAll(amenities),
        Object.hashAll(photoUrls),
        isAvailable,
        createdAt,
        latitude,
        longitude,
        forWhom,
      );
}