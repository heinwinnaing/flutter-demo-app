import 'package:flutter/material.dart';
import 'package:mpoints_app/core/themes/app_color.dart';
import 'package:mpoints_app/core/themes/app_font.dart';
import 'package:mpoints_app/features/shops/models/shop_model.dart';

class ShopDetailScreen extends StatefulWidget {
  const ShopDetailScreen(
      {super.key, required this.id, required this.name, this.data});
  final String? id;
  final String? name;
  final ShopModel? data;

  @override
  State<ShopDetailScreen> createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends State<ShopDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Image(
            image: NetworkImage(widget.data?.logoUrl ?? ''),
            height: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(widget.name ?? 'Shop Details')
        ]),
        backgroundColor: AppColor.clrButton,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              child: Image(image: NetworkImage(widget.data?.logoUrl ?? '')),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.data?.description ?? '',
                style: AppFont.normal(),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Phone:',
                  style: AppFont.normal(
                      fontWeight: FontWeight.bold, color: AppColor.clrButton),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    widget.data?.phone ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Address:',
                  style: AppFont.normal(
                      fontWeight: FontWeight.bold, color: AppColor.clrButton),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    widget.data?.address ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
