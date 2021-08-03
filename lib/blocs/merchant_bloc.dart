import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_app_engineer/models/list_merchants_response.dart';
import 'package:mobile_app_engineer/repositories/merchant_repository.dart';

part 'merchant_event.dart';
part 'merchant_state.dart';

class MerchantBloc extends Bloc<MerchantEvent, MerchantState> {
  final MerchantRepository merchantRepository;
  MerchantBloc(this.merchantRepository) : super(MerchantInitial()) ;

  @override
  Stream<MerchantState> mapEventToState(
    MerchantEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetMerchantsList) {
      yield MerchantInitial();
      try {
        final listMerchants = await merchantRepository.fetchMerchants(event.nbMerchants);
        yield GetMerchantsListState(listMerchants);
      } on NetworkError {
        yield ErrorState("Couldn't fetch merchants. Is the device online?");
      }
    }
  }
}
