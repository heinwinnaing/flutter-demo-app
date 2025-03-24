import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:mpoints_app/core/themes/app_font.dart';
import 'package:mpoints_app/utils.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MemberCardWidget extends StatefulWidget {
  const MemberCardWidget(
      {super.key,
      required this.isLoading,
      this.fullName,
      this.accountNumber,
      this.totalPoints,
      this.imgBarcode});
  final bool isLoading;
  final String? fullName;
  final String? accountNumber;
  final int? totalPoints;
  final String? imgBarcode;

  @override
  State<MemberCardWidget> createState() => _MemberCardWidgetState();
}

class _MemberCardWidgetState extends State<MemberCardWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return Skeletonizer(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(18, 29, 33, 1),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('afdaffdf')
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.code_outlined, size: 40),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text('.............')
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.code_outlined, size: 40),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(18, 29, 33, 1),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Points",
                      style: AppFont.normal(color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      Utils.numberDisplay(widget.totalPoints ?? 0),
                      style: AppFont.extraLarge(
                          fontWeight: FontWeight.bold, color: Colors.yellow),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/logo-white.png'),
                      width: 75,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      widget.fullName ?? 'NAME ON CARD',
                      style: AppFont.normal(color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      Utils.cardNumberDisplay(
                              widget.accountNumber ?? '0000000000000000')
                          .trim(),
                      style: AppFont.normal(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: Container(
                              height: 300,
                              padding: const EdgeInsets.only(
                                  top: 0, left: 0, right: 0, bottom: 0),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Place barcode scanner inside the frame',
                                    textAlign: TextAlign.center,
                                    style: AppFont.large(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 15,
                                        left: 25,
                                        right: 25,
                                        bottom: 15),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2.5,
                                            color: const Color.fromRGBO(
                                                16, 117, 105, 1))),
                                    child: BarcodeWidget(
                                      barcode: Barcode.code128(),
                                      drawText: false,
                                      data: widget.accountNumber ?? 'err',
                                      backgroundColor: Colors.white, // C
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.fullName ?? 'NAME ON CARD',
                                        style: AppFont.small(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        Utils.cardNumberDisplay(
                                            widget.accountNumber ??
                                                '0000 0000 0000 0000'),
                                        style: AppFont.small(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ),
                      ),
                      child: BarcodeWidget(
                        barcode: Barcode.code128(),
                        drawText: false,
                        data: widget.accountNumber ?? 'err',
                        width: 150,
                        height: 60,
                        backgroundColor: Colors.white, // C
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }
  }
}
