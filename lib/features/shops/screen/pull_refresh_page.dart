import 'package:flutter/material.dart';
import 'dart:math';

import 'package:mpoints_app/core/forms/slivers/sliver_list.dart';

class PullRefreshPage extends StatefulWidget {
  const PullRefreshPage();

  @override
  State<PullRefreshPage> createState() => _PullRefreshPageState();
}

class _PullRefreshPageState extends State<PullRefreshPage> {
  List<String> numbersList = NumberGenerator().numbers;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pull Refresh')),
      body: Container(child: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: CustomScrollView(
          slivers: [
            AppSliverList.promotionSliverList(isLoading, []),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                alignment: Alignment.center,
                child: Text(numbersList[index]),
              ),
              childCount: numbersList.length,
            ))
          ],
        ),
      ),)
    );
  }

  Future<void> _pullRefresh() async {
    List<String> freshNumbers = await NumberGenerator().slowNumbers();
    setState(() {
      numbersList = freshNumbers;
      isLoading = false;
    });
  }
}

class NumberGenerator {
  Future<List<String>> slowNumbers() async {
    return Future.delayed(
      const Duration(milliseconds: 1000),
      () => numbers,
    );
  }

  List<String> get numbers => List.generate(5, (index) => number);

  String get number => Random().nextInt(99999).toString();
}
