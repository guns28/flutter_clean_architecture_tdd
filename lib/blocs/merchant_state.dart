part of 'merchant_bloc.dart';

abstract class MerchantState extends Equatable {
  const MerchantState();
}

class MerchantInitial extends MerchantState {
  @override
  List<Object> get props => [];
}

class GetMerchantsListState extends MerchantState {
  final List<Merchant> response;
  GetMerchantsListState(this.response);
  @override
  List<Object> get props => [response];
}

class ErrorState extends MerchantState {
  final String error;
  ErrorState(this.error);
  @override
  List<Object> get props => [error];
}