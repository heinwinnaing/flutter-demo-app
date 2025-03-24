import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mpoints_app/features/profile/models/transaction_model.dart';
import 'package:mpoints_app/utils.dart';

class TransactionListWidget extends StatefulWidget {
  const TransactionListWidget({super.key, required this.isLoading, this.data});
  final bool isLoading;
  final List<TransactionModel>? data;

  @override
  State<TransactionListWidget> createState() => _TransactionListWidgetState();
}

class _TransactionListWidgetState extends State<TransactionListWidget> {
  Widget emptyTransaction() => Container(
        padding: const EdgeInsets.all(20),
        alignment: AlignmentDirectional.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
    if (widget.isLoading) {
      List<int> rowSkeletons = const [1];
      return Column(
        children: rowSkeletons
            .map((item) => Container(
                padding: const EdgeInsets.only(
                    top: 33, left: 0, right: 0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.staggeredDotsWave(
                      color: const Color(0xFF1A1A3F),
                      size: 33,
                    ),
                  ],
                )))
            .toList(),
      );
    }
    if (widget.data?.isEmpty == true && widget.isLoading == false) {
      return emptyTransaction();
    } else {
      final pointTransactions = widget.data as List<TransactionModel>;
      return Column(
        children: pointTransactions
            .map((transaction) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 0, left: 0, right: 0, bottom: 20),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Row(children: [
                        Image.network(
                          transaction.shop?.logoUrl ?? '',
                          width: 50,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white54),
                                ),
                              );
                            }
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Text(
                                'ERROR',
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transaction.shop?.name ?? 'Shop',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              Utils.displayDate(
                                  transaction.transactionDate ?? DateTime.now(),
                                  'MMM dd, yyyy, hh:mm a'),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      transaction.transactionType == 'used'
                          ? '-${transaction.totalPoints}'
                          : '+${transaction.totalPoints}',
                      style: TextStyle(
                          color: transaction.transactionType == 'used'
                              ? Colors.red
                              : Colors.green),
                    ),
                  ],
                ))
            .toList(),
      );
    }
  }
}
