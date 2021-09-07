import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_engineer/core/errors/failure.dart';
import 'package:mobile_app_engineer/data/models/list_merchants_response.dart';
import 'package:mobile_app_engineer/data/repositories/merchants_repository_impl.dart';
import 'package:mobile_app_engineer/domain/usecases/get_merchants.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_merchants_test.mocks.dart';

class MerchantsRepositoryImplMock extends Mock implements MerchantsRepositoryImpl {}

@GenerateMocks([], customMocks: [
  MockSpec<MerchantsRepositoryImplMock>(returnNullOnMissingStub: true)])
void main() {

  final MockMerchantsRepositoryImplMock mockMerchantRepository =
  MockMerchantsRepositoryImplMock();

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

  ListMerchantsResponse merchantResponse =
  ListMerchantsResponse(merchants: merchantList);

  GetMerchants getMerchants = GetMerchants(mockMerchantRepository);

  test('should get remote merchants from the repository', () async {
    // arrange
    when(mockMerchantRepository.getListMerchants(1))
        .thenAnswer((_) => Future.value(Right(merchantResponse.merchants!)));

    // act
    final result = await getMerchants.call(const MerchantsParams(nbMerchants: 1));

    // assert
    expect(result, Right(merchantResponse.merchants!));
    verify(mockMerchantRepository.getListMerchants(1));
    verifyNoMoreInteractions(MockMerchantsRepositoryImplMock());
  });

  test('should get Failure from the repository', () async {
    // arrange
    when(mockMerchantRepository.getListMerchants(1))
        .thenAnswer((_) => Future.value(Left(ServerFailure())));

    // act
    final result = await getMerchants.call(const MerchantsParams(nbMerchants: 1));

    // assert
    expect(result, Left(ServerFailure()));
    verify(mockMerchantRepository.getListMerchants(1));
    verifyNoMoreInteractions(MockMerchantsRepositoryImplMock());
  });

}
