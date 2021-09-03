import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_app_engineer/core/errors/failure.dart';
import 'package:mobile_app_engineer/data/models/list_merchants_response.dart';
import 'package:mobile_app_engineer/domain/usecases/get_merchants.dart';

part 'merchant_state.dart';

class MerchantCubit extends Cubit<MerchantState> {
  MerchantCubit(this.getMerchants) : super(MerchantInitial());
  final GetMerchants getMerchants;

  Future<void> merchantsGet({
    required int nbMerchants
  }) async {
    emit(MerchantInitial());
    final Either<Failure, List<Merchant>> listMerchants =
    await getMerchants(MerchantsParams(nbMerchants: nbMerchants));
    emit(
        listMerchants.fold(
                (Failure failure) => ErrorState(_mapFailureToMessage(failure)),
                (List<Merchant> merchants) => GetMerchantsListState(merchants)
        )
    );

  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return FailureMessage.server;
      default:
        return FailureMessage.unexpected;
    }
  }
}
