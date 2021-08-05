part of 'merchant_bloc.dart';

abstract class MerchantEvent extends Equatable {
  const MerchantEvent();
}

class GetMerchantsList extends MerchantEvent {
  const GetMerchantsList(this.nbMerchants);

  final int nbMerchants ;

  List<Object> get props => [];
}
