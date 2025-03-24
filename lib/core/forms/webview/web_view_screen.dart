import 'package:flutter/material.dart';
import 'package:mpoints_app/core/themes/app_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.url, required this.title});
  final String? url;
  final String? title;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url ?? ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.clrButton,
        title: Text(widget.title ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: WebViewWidget(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
