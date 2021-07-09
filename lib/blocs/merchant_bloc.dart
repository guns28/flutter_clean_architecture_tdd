import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:mobile_app_engineer/globals/constants.dart';
import 'package:mobile_app_engineer/models/list_merchants_response.dart';
import 'package:http/http.dart' as http;

part 'merchant_event.dart';
part 'merchant_state.dart';

class MerchantBloc extends Bloc<MerchantEvent, MerchantState> {
  MerchantBloc() : super(MerchantInitial());

  @override
  Stream<MerchantState> mapEventToState(
    MerchantEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetMerchantsList) {
      //try {
        yield MerchantInitial();

        var url = "$baseUrl$listMerchants?limit=${event.nbMerchants}";
        print(url);

        final Response response = await http.get(Uri.parse(url));
        final jsonDecoded = json.decode(utf8.decode(response.bodyBytes));

        print(jsonDecoded);

        if (response.statusCode == 200) {
          final listMerchants = ListMerchantsResponse.fromJson(jsonDecoded);
          if(listMerchants.merchants != null){
            yield GetMerchantsListState(listMerchants.merchants!);
          }
        } else {
          yield ErrorState('error');
        }
     // } catch (e) {
       // yield ErrorState("error");
      //}
    }
  }
}
