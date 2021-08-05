import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_engineer/blocs/merchant_bloc.dart';
import 'package:mobile_app_engineer/repositories/merchant_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mobile_app_engineer/models/list_merchants_response.dart';

import 'fetch_restaurant_test.mocks.dart';

class MockMerchantRepository extends Mock implements MerchantRepository {}

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([MockMerchantRepository])
void main() {

  final mockMerchantRepository = MockMockMerchantRepository();

  List<Merchant> merchantList = [
    Merchant(
        id: 14918,
        name: "Restaurant Dynasty",
        phoneNumber: "+31206268400",
        currency: "EUR",
        locale: "nl_NL",
        timezone: "Europe/Amsterdam",
        location: Location(
          coordinates: Coordinates(latitude: 52.36635, longitude: 4.890594),
          address: Address(
              street: "Reguliersdwarsstraat",
              number: "30",
              zipcode: "1017 BM",
              city: "Amsterdam",
              country: "NLD",
              district: "Centrum"),
        ),
        reviewScore: "5.3",
        tagGroups: [
          TagGroups(type: "CUISINE", tags: [
            Tag(id: "da455679-6487-448b-89d5-80c15a5fd6e3", name: "Cantonese"),
            Tag(id: "2d433a8d-ff63-4d0b-b6e8-804cbd44a440", name: "Asian"),
            Tag(id: "0b48e3f6-b749-458a-8484-38279c5837e9", name: "Chinese")
          ]),
          TagGroups(type: "PRICE", tags: [
            Tag(
                id: "296929a4-324e-476b-b076-2f9c061d4756",
                name: "price average")
          ])
        ],
        images: [
          Image(
              url:
                  "https://d24horgtq2wtu8.cloudfront.net/3cb97a84-affe-4d76-96a1-25be9d9fc0e8/99379_sld.jpg"),
          Image(
              url:
                  "https://d24horgtq2wtu8.cloudfront.net/3cb97a84-affe-4d76-96a1-25be9d9fc0e8/99382_sld.jpg"),
          Image(
              url:
                  "https://d24horgtq2wtu8.cloudfront.net/3cb97a84-affe-4d76-96a1-25be9d9fc0e8/99385_sld.jpg"),
          Image(
              url:
                  "https://d24horgtq2wtu8.cloudfront.net/3cb97a84-affe-4d76-96a1-25be9d9fc0e8/99389_sld.jpg"),
          Image(
              url:
                  "https://d24horgtq2wtu8.cloudfront.net/3cb97a84-affe-4d76-96a1-25be9d9fc0e8/99390_sld.jpg")
        ],
        documents: [],
        links: [
          Link(
              href:
                  "https://www.quandoo.nl/place/reservationsrestaurantdynasty-nl-14918",
              method: "GET",
              rel: "details"),
          Link(
              href:
                  "https://widget.quandoo.nl/widget/reservation/merchant/pXCHq?&countryId=NLD",
              method: "GET",
              rel: "widget"),
          Link(
              href:
                  "https://widget.quandoo.nl/widget/reservation/merchant/pXCHq/details?&countryId=NLD",
              method: "GET",
              rel: "widget.details")
        ],
        bookable: true,
        openingTimes: OpeningTimes(
            standardOpeningTimes: StandardOpeningTimes(
                WEDNESDAY: [Day(start: "17:30:00", end: "22:30:00")],
                MONDAY: [Day(start: "17:30:00", end: "22:30:00")],
                THURSDAY: [Day(start: "17:30:00", end: "22:30:00")],
                SUNDAY: [Day(start: "17:30:00", end: "22:30:00")],
                FRIDAY: [Day(start: "17:30:00", end: "22:30:00")],
                SATURDAY: [Day(start: "17:30:00", end: "22:30:00")])),
        ccvEnabled: false)
  ];

  group("Fetch Merchants", (){

    blocTest<MerchantBloc, MerchantState>(
      'Check if merchant fetch return correct data',
      build: () {
        when(mockMerchantRepository.fetchMerchants(1)).thenAnswer((_) async => merchantList);
        return MerchantBloc(mockMerchantRepository);
      },
      act: (bloc) => bloc.add(const GetMerchantsList(1)),
      expect: () => [MerchantInitial(), GetMerchantsListState(merchantList)],
    );

    blocTest<MerchantBloc, MerchantState>(
      'Check error state when fetching merchants',
      build: () {
        when(mockMerchantRepository.fetchMerchants(1)).thenThrow(Exception());
        return MerchantBloc(mockMerchantRepository);
      },
      act: (MerchantBloc bloc) => bloc.add(const GetMerchantsList(1)),
      expect: () => [MerchantInitial(), const ErrorState("Couldn't fetch merchants. Is the device online?")],
    );

  });
}
