import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/landlord.dart';
import '../models/listing.dart';

class ListingRepository {
  final List<Landlord> _landlords;
  final List<Listing> _listings;

  ListingRepository({
    List<Landlord>? landlords,
    List<Listing>? listings,
  })  : _landlords = List.unmodifiable(landlords ?? sampleLandlords),
        _listings = List.unmodifiable(listings ?? sampleListings);

  List<Listing> getAllListings() => _listings;

  List<Landlord> getAllLandlords() => _landlords;

  Listing? getListingById(String id) {
    for (final listing in _listings) {
      if (listing.id == id) return listing;
    }
    return null;
  }

  Landlord? getLandlordById(String id) {
    for (final landlord in _landlords) {
      if (landlord.id == id) return landlord;
    }
    return null;
  }

  List<Listing> getListingsByLandlord(String landlordId) {
    return _listings
        .where((listing) => listing.landlordId == landlordId)
        .toList(growable: false);
  }

  List<Listing> searchListings({
    String? query,
    String? district,
    int? maxMonthlyRentUsd,
    bool onlyAvailable = false,
    ListingAudience? forWhom,
  }) {
    final normalizedQuery = query?.trim().toLowerCase() ?? '';
    final normalizedDistrict = district?.trim().toLowerCase() ?? '';

    return _listings.where((listing) {
      if (onlyAvailable && !listing.isAvailable) {
        return false;
      }
      if (normalizedDistrict.isNotEmpty &&
          normalizedDistrict != 'all' &&
          listing.district.toLowerCase() != normalizedDistrict) {
        return false;
      }
      if (maxMonthlyRentUsd != null &&
          listing.monthlyRentUsd > maxMonthlyRentUsd) {
        return false;
      }
      if (forWhom != null &&
          forWhom != ListingAudience.studentsWelcome &&
          listing.forWhom != forWhom) {
        return false;
}
      if (normalizedQuery.isNotEmpty) {
        final matchesTitle =
            listing.title.toLowerCase().contains(normalizedQuery);
        final matchesDescription =
            listing.description.toLowerCase().contains(normalizedQuery);
        final matchesDistrict =
            listing.district.toLowerCase().contains(normalizedQuery);
        final matchesAddress =
            listing.address.toLowerCase().contains(normalizedQuery);
        final matchesAmenities = listing.amenities.any(
          (amenity) => amenity.toLowerCase().contains(normalizedQuery),
        );
        if (!matchesTitle &&
            !matchesDescription &&
            !matchesDistrict &&
            !matchesAddress &&
            !matchesAmenities) {
          return false;
        }
      }
      return true;
    }).toList(growable: false);
  }

  LandlordTrustBadge getBadgeForLandlord(String landlordId) {
    final activeCount = _listings
        .where((listing) => listing.landlordId == landlordId && listing.isAvailable)
        .length;
    return LandlordTrustBadge.fromPostingCount(activeCount);
  }

  static final List<Landlord> sampleLandlords = [
    Landlord(
      id: 'landlord_1',
      name: 'Azizbek Karimov',
      phone: '+998 90 123 45 67',
      isVerified: true,
      trustSummary: 'Verified owner · Transparent student lease terms',
      rating: 4.9,
      reviewCount: 14,
      joinedAt: DateTime(2024, 9, 1),
    ),
    Landlord(
      id: 'landlord_2',
      name: 'Dilnoza Rustamova',
      phone: '+998 93 456 78 90',
      isVerified: true,
      trustSummary: 'Verified owner · Quiet study-friendly apartments',
      rating: 4.7,
      reviewCount: 9,
      joinedAt: DateTime(2025, 1, 15),
    ),
    Landlord(
      id: 'landlord_3',
      name: 'Javohir Tursunov',
      phone: '+998 97 789 01 23',
      isVerified: false,
      trustSummary: 'Newer host · Awaiting full document verification',
      rating: 4.3,
      reviewCount: 3,
      joinedAt: DateTime(2026, 8, 10),
    ),
  ];

  static final List<Listing> sampleListings = [
    Listing(
      id: 'listing_1',
      landlordId: 'landlord_1',
      title: 'Bright 2-Room Apartment Near Campus Route',
      description:
          'Clean 2-room apartment with study desks, high-speed internet, and easy public transit access for students.',
      district: 'Mirzo-Ulugbek',
      address: 'Buyuk Ipak Yuli street, block 42',
      monthlyRentUsd: 380,
      roomCount: 2,
      propertyType: 'Apartment',
      amenities: ['Wi-Fi', 'Washing Machine', 'Air Conditioning', 'Study Desk'],
      photoUrls: ['assets/app_icon.png'],
      isAvailable: true,
      createdAt: DateTime(2026, 10, 5),
      latitude: 41.3412, 
      longitude: 69.3361, 
      forWhom: ListingAudience.studentsWelcome,
    ),
    Listing(
      id: 'listing_2',
      landlordId: 'landlord_1',
      title: 'Private Room in Shared Student Flat',
      description:
          'Furnished private room with shared kitchen and bathroom. Quiet building suitable for exam prep.',
      district: 'New Tashkent',
      address: 'Mahtumquli corridor area, building 12',
      monthlyRentUsd: 210,
      roomCount: 1,
      propertyType: 'Private Room',
      amenities: ['Wi-Fi', 'Washing Machine', 'Heating'],
      photoUrls: ['assets/app_icon.png'],
      isAvailable: true,
      createdAt: DateTime(2026, 10, 12),
      latitude: 41.3450, 
      longitude: 69.3420, 
      forWhom: ListingAudience.girls,
    ),
    Listing(
      id: 'listing_3',
      landlordId: 'landlord_2',
      title: 'Cozy 1-Room Flat Near Metro & Shops',
      description:
          'Compact 1-room apartment close to grocery stores, cafes, and metro line with clear utility rules.',
      district: 'Chilonzor',
      address: 'Bunyodkor avenue, 8th kvartal',
      monthlyRentUsd: 320,
      roomCount: 1,
      propertyType: 'Apartment',
      amenities: ['Wi-Fi', 'Refrigerator', 'Washing Machine', 'Air Conditioning'],
      photoUrls: ['assets/app_icon.png'],
      isAvailable: true,
      createdAt: DateTime(2026, 10, 18),
      latitude: 41.2856, 
      longitude: 69.2034, 
      forWhom: ListingAudience.boys,
    ),
    Listing(
      id: 'listing_4',
      landlordId: 'landlord_3',
      title: 'Shared 3-Room Apartment for Roommates',
      description:
          'Spacious 3-room flat well-suited for three students sharing rent and bills.',
      district: 'Yunusobod',
      address: 'Amir Temur street, block 19',
      monthlyRentUsd: 460,
      roomCount: 3,
      propertyType: 'Shared Room',
      amenities: ['Wi-Fi', 'Washing Machine', 'Balcony'],
      photoUrls: ['assets/app_icon.png'],
      isAvailable: false,
      createdAt: DateTime(2026, 10, 24),
      latitude: 41.3385, 
      longitude: 69.2845, 
      forWhom: ListingAudience.studentsWelcome,
    ),
  ];
}

final listingRepositoryProvider = Provider<ListingRepository>((ref) {
  return ListingRepository();
});

final listingsProvider = Provider<List<Listing>>((ref) {
  return ref.watch(listingRepositoryProvider).getAllListings();
});

final landlordsProvider = Provider<List<Landlord>>((ref) {
  return ref.watch(listingRepositoryProvider).getAllLandlords();
});