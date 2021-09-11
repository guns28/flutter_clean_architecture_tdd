import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kiwi/kiwi.dart';
import 'package:mobile_app_engineer/data/models/list_merchants_response.dart';
import 'package:mobile_app_engineer/domain/usecases/get_merchants.dart';
import 'package:mobile_app_engineer/dependency_injection/injector.dart';
import 'package:mobile_app_engineer/screens/details_restaurant_screen/details_merchant_screen.dart';
import 'package:mobile_app_engineer/screens/list_restaurant_screen/business_logic/merchant_cubit.dart';
import 'package:mobile_app_engineer/screens/list_restaurant_screen/merchant_cell.dart';

class ListMerchantScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListMerchantScreenState();
  }
}

class ListMerchantScreenState extends State<ListMerchantScreen> {
  List<Merchant> listMerchants = [];
  late MerchantCubit merchantCubit;
  final container = KiwiContainer();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome", style:  TextStyle(color: Colors.white, fontSize: 24,
            fontWeight: FontWeight.bold)),
        leading: const SizedBox(),
      ),
        body: BlocListener<MerchantCubit, MerchantState>(
          listener: (BuildContext c, MerchantState state) async {
            if (state is MerchantInitial) {
              EasyLoading.show(status: 'Please Wait...');
            }

            if (state is GetMerchantsListState) {
              EasyLoading.dismiss();
              listMerchants = state.response;
            }

            if (state is ErrorState) {
              EasyLoading.dismiss();
            }
          },
          child:BlocBuilder<MerchantCubit, MerchantState>(
              builder: (BuildContext c, MerchantState state) {
                print("state $state");
                if (state is MerchantInitial) {
                  BlocProvider.of<MerchantCubit>(context).merchantsGet(nbMerchants: 50);
                  return Container();
                } else if (state is GetMerchantsListState) {
                  return body(c, state);
                } else {
                  return Center(
                    child: Text("Server failure", style: Theme.of(context).textTheme.headline4),
                  );
                }
              }),
        )
    );
  }

  Widget body(BuildContext context, MerchantState state) {
    // TODO: Implement build
    return merchantList();
  }

  Widget merchantList(){
    return ListView.builder(
      itemCount: listMerchants.length,
      shrinkWrap: true,
      key: const ValueKey('merchant_list'),
      itemBuilder: (BuildContext context, int index) {
        return MerchantCell(id:listMerchants[index].id.toString(), name: listMerchants[index].name,
            imageUrl: listMerchants[index].images!.isNotEmpty
                ? listMerchants[index].images!.first.url
                : "https://via.placeholder.com/350x150",
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => DetailMerchantScreen(listMerchants[index])));
            });
      },
    );
  }

}