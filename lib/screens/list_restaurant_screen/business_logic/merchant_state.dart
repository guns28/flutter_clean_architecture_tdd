part of 'merchant_cubit.dart';

abstract class MerchantState extends Equatable {
  const MerchantState();
}

class MerchantInitial extends MerchantState {
  @override
  List<Object> get props => [];
}

class GetMerchantsListState extends MerchantState {
  const GetMerchantsListState(this.response);

  final List<Merchant> response;

  @override
  List<Object> get props => [response];
}

class ErrorState extends MerchantState {
  const ErrorState(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}