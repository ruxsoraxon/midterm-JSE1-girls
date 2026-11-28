import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:real_landlords_for_students/data/listing_repository.dart';
import 'package:real_landlords_for_students/models/landlord.dart';
import 'package:real_landlords_for_students/models/listing.dart';

void main() {
  group('Landlord model', () {
    test('supports creation, map serialization, copyWith, and equality', () {
      final joinedAt = DateTime(2025, 3, 10);
      final landlord = Landlord(
        id: 'l_1',
        name: 'Sardor Alimov',
        phone: '+998 90 000 11 22',
        isVerified: true,
        trustSummary: 'Verified owner',
        rating: 4.8,
        reviewCount: 7,
        joinedAt: joinedAt,
        avatarUrl: 'https://example.com/avatar.png',
      );

      final roundTrip = Landlord.fromMap(landlord.toMap());
      expect(roundTrip, equals(landlord));
      expect(roundTrip.hashCode, equals(landlord.hashCode));

      final updated = landlord.copyWith(rating: 4.9, reviewCount: 8);
      expect(updated.rating, 4.9);
      expect(updated.reviewCount, 8);
      expect(updated.id, landlord.id);
      expect(updated, isNot(equals(landlord)));
    });
  });

  group('LandlordTrustBadge', () {
    test('computes badge tiers from active posting count', () {
      expect(
        LandlordTrustBadge.fromPostingCount(1),
        LandlordTrustBadge.likelyOwner,
      );
      expect(
        LandlordTrustBadge.fromPostingCount(3),
        LandlordTrustBadge.likelyOwner,
      );
      expect(
        LandlordTrustBadge.fromPostingCount(4),
        LandlordTrustBadge.checkCarefully,
      );
      expect(
        LandlordTrustBadge.fromPostingCount(19),
        LandlordTrustBadge.checkCarefully,
      );
      expect(
        LandlordTrustBadge.fromPostingCount(20),
        LandlordTrustBadge.likelyBroker,
      );
    });
  });

  group('Listing model', () {
    test('supports creation, map serialization, copyWith, and equality', () {
      final createdAt = DateTime(2026, 11, 1);
      final listing = Listing(
        id: 'list_1',
        landlordId: 'l_1',
        title: 'Sunny Room Near University',
        description: 'Quiet room with fast internet.',
        district: 'Mirzo-Ulugbek',
        address: 'Sample Street 10',
        monthlyRentUzs: 2500000,
        roomCount: 1,
        propertyType: 'Private Room',
        amenities: ['Wi-Fi', 'Heating'],
        photoUrls: ['assets/app_icon.png'],
        isAvailable: true,
        createdAt: createdAt,
        latitude: 41.3275,
        longitude: 69.2810,
        forWhom: ListingAudience.studentsWelcome,
      );

      final roundTrip = Listing.fromMap(listing.toMap());
      expect(roundTrip, equals(listing));
      expect(roundTrip.hashCode, equals(listing.hashCode));

      final updated = listing.copyWith(monthlyRentUzs: 2400000, isAvailable: false);
      expect(updated.monthlyRentUzs, 2400000);
      expect(updated.isAvailable, isFalse);
      expect(updated.title, listing.title);
      expect(updated, isNot(equals(listing)));
      final girlsListing = listing.copyWith(forWhom: ListingAudience.girls);
      expect(girlsListing.forWhom, ListingAudience.girls);
      expect(girlsListing.latitude, 41.3275);
      expect(girlsListing.longitude, 69.2810);
    });
  });

  group('ListingRepository and Riverpod providers', () {
    late ListingRepository repository;

    setUp(() {
      repository = ListingRepository();
    });

    test('exposes non-empty sample listings and landlords with valid links', () {
      final listings = repository.getAllListings();
      final landlords = repository.getAllLandlords();

      expect(listings, isNotEmpty);
      expect(landlords, isNotEmpty);

      for (final listing in listings) {
        final owner = repository.getLandlordById(listing.landlordId);
        expect(
          owner,
          isNotNull,
          reason: 'Every sample listing must reference an existing landlord',
        );
      }
    });

    test('looks up listings and landlords by ID and filters correctly', () {
      final first = repository.getListingById('listing_1');
      expect(first, isNotNull);
      expect(first!.district, 'Mirzo-Ulugbek');
      expect(repository.getListingById('non_existent'), isNull);

      final landlordListings = repository.getListingsByLandlord('landlord_1');
      expect(landlordListings.length, 2);

      final affordableAvailable = repository.searchListings(
        maxMonthlyRentUzs: 3500000,
        onlyAvailable: true,
      );
      expect(affordableAvailable, isNotEmpty);
      expect(
        affordableAvailable.every(
          (item) => item.monthlyRentUzs <= 3500000 && item.isAvailable,
        ),
        isTrue,
      );

      final byQuery = repository.searchListings(query: 'chilonzor');
      expect(byQuery.length, 1);
      expect(byQuery.first.id, 'listing_3');

      final girlsOnly = repository.searchListings(
        forWhom: ListingAudience.girls,
      );
      expect(
        girlsOnly.every((item) => item.forWhom == ListingAudience.girls),
        isTrue,
      );

      final badge = repository.getBadgeForLandlord('landlord_1');
      expect(badge, isA<LandlordTrustBadge>());
    });

    test('Riverpod providers expose sample data cleanly', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final listings = container.read(listingsProvider);
      final landlords = container.read(landlordsProvider);

      expect(listings, equals(repository.getAllListings()));
      expect(landlords, equals(repository.getAllLandlords()));
    });
  });
}