import 'dart:async';
import 'package:Serravalle/widgets/navigation_control.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';

class WebviewScreen extends StatefulWidget {
  static const String routeName = "/Webview-Screen";

  @override
  _WebviewScreenState createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  int _stackToView = 1;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Serravalle'),
        actions: [
          NavigationControls(
            webViewController: _controller.future,
          )
        ],
      ),
      body: Builder(
        builder: (context) {
          return IndexedStack(
            index: _stackToView,
            children: [
              WebView(
                initialUrl: 'https://www.elettrautoserravalle.com/',
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: (url) {
                  setState(() {
                    _stackToView = 0;
                  });
                },
                onWebViewCreated: (webViewController) {
                  _controller.complete(webViewController);
                },
              ),
              Container(
                margin: const EdgeInsets.all(70),
                child: Center(
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballScaleRippleMultiple,
                    color: Color(0xFFF58220),
                  ),
                ),
              ),
            ],
          );
          // return _isLoading
          //     ? LoadingIndicator(
          //         indicatorType: Indicator.ballScaleRippleMultiple)
          //     : WebView(
          //         initialUrl: 'https://www.elettrautoserravalle.com/',
          //         javascriptMode: JavascriptMode.unrestricted,
          //         onPageFinished: (url) {
          //           setState(() {
          //             _isLoading = false;
          //           });
          //         },
          //         onWebViewCreated: (webViewController) {
          //           _controller.complete(webViewController);
          //         },
          //       );
        },
      ),
    ));
  }
}
