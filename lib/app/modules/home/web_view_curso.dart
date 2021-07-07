import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewCurso extends StatefulWidget {
  final String url;

  const WebViewCurso({Key key, this.url}) : super(key: key);

  @override
  _WebViewCursoState createState() => _WebViewCursoState();
}

class _WebViewCursoState extends State<WebViewCurso> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.url,
      ),
    );
  }
}
