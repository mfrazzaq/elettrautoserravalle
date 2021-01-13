import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationControls extends StatelessWidget {
  final Future<WebViewController> webViewController;
  const NavigationControls({this.webViewController});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final WebViewController controller = snapshot.data;
          return Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () async {
                  if (await controller.canGoBack()) {
                    controller.goBack();
                  } else {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Nessun elemento della cronologia precedente'),
                      ),
                    );
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () async {
                  if (await controller.canGoForward()) {
                    controller.goForward();
                  } else {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Nessun elemento della cronologia in avanti'),
                      ),
                    );
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () async {
                  controller.reload();
                },
              )
            ],
          );
        } else {
          return Container();
        }
      },
      future: webViewController,
    );
  }
}
