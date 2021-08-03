part of 'merchant_bloc.dart';

abstract class MerchantEvent extends Equatable {
  const MerchantEvent();
}

class GetMerchantsList extends MerchantEvent {
  final int nbMerchants ;
  const GetMerchantsList(this.nbMerchants);

  List<Object> get props => [];
}
