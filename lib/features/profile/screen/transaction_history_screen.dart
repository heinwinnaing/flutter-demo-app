import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/constants/images.dart';
import 'package:mpoints_app/core/themes/app_font.dart';
import 'package:mpoints_app/features/profile/controllers/profile_controller.dart';
import 'package:mpoints_app/features/profile/models/transaction_paging_model.dart';
import 'package:mpoints_app/features/profile/widgets/transaction_list_widget.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  final profileController = Get.put(ProfileController());
  bool isLoading = true;
  TransactionPagingModel? transactionData;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    final result = await profileController.getTransactions(1, 10);
    setState(() {
      isLoading = false;
      transactionData = result;
    });
  }

  PreferredSizeWidget appBar() => AppBar(
        title: Text(
          'Transactions History'.toUpperCase(),
          style: AppFont.normal(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(19, 191, 170, 1),
      );

  Widget emptyTransaction() => Container(
        padding: const EdgeInsets.all(20),
        alignment: AlignmentDirectional.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(imgEmptyTransaction)),
            Text(
              'No Transactions',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(51, 51, 51, 1)),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'After your first transaction you will be able to view it here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(96, 100, 111, 1)),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    if (transactionData?.dataList?.isEmpty == true && isLoading == false) {
      return Scaffold(
          appBar: appBar(),
          body: emptyTransaction());
    } else {
      return Scaffold(
          appBar: appBar(),
          body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.only(
                    top: 35, left: 15, right: 15, bottom: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Date From', style: TextStyle(fontSize: 16),),
                                const SizedBox(height: 10,),
                                TextFormField(
                                  style: const TextStyle(
                                      fontFamily: 'Josefin Sans'),
                                  decoration: const InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.calendar_today,
                                        color: Color.fromRGBO(19, 191, 170, 1),
                                      ),
                                      hintText: 'DD/MM/YYYY',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  19, 191, 170, 1))),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  19, 191, 170, 1))),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide:
                                              BorderSide(color: Colors.red))),
                                  onChanged: (String? value) {},
                                ),
                              ]),
                        ),
                        const SizedBox(width: 15,),
                        Flexible(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Date To', style: TextStyle(fontSize: 16),),
                                const SizedBox(height: 10,),
                                TextFormField(
                                  style: const TextStyle(
                                      fontFamily: 'Josefin Sans'),
                                  decoration: const InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.calendar_today,
                                        color: Color.fromRGBO(19, 191, 170, 1),
                                      ),
                                      hintText: 'DD/MM/YYYY',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  19, 191, 170, 1))),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  19, 191, 170, 1))),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide:
                                              BorderSide(color: Colors.red))),
                                  onChanged: (String? value) {},
                                ),
                              ]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    TransactionListWidget(isLoading: isLoading, data: transactionData?.dataList ?? [],)
                  ],
                )),
          ));
    }
  }
}
