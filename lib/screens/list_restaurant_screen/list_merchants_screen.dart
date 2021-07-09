import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_app_engineer/blocs/merchant_bloc.dart';
import 'package:mobile_app_engineer/models/list_merchants_response.dart';

class ListMerchantScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ListMerchantScreenState();
  }
}

class ListMerchantScreenState extends State<ListMerchantScreen> {

  final _merchantBloc = MerchantBloc();
  late List<Merchant> listMerchants;


  @override
  void initState() {
    super.initState();
    _merchantBloc.add(GetMerchantsList(120));
  }

  @override
  void dispose() {
    _merchantBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener(
          bloc: _merchantBloc,
          listener: (c, MerchantState state) async {
            if (state is MerchantInitial) {
              EasyLoading.show(status: 'Please Wait...');
            }

            if (state is GetMerchantsListState) {
              EasyLoading.dismiss();
              print(state.response.first.name);
            }

            if (state is ErrorState) {
              EasyLoading.dismiss();
            }
          },
          child: BlocBuilder(
              bloc: _merchantBloc,
              builder: (c, MerchantState state) {
                return body(c, state);
              }),
        ));
  }

  Widget body(BuildContext context, MerchantState state) {
    // TODO: Implement build
    return Container(
    );
  }
}