import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  WebViewPageState createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  late InAppWebViewController webViewController;
  @override void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView Events' , style: TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white
      ),
      body: InAppWebView(
        // ignore: deprecated_member_use
        initialOptions: InAppWebViewGroupOptions(
          // ignore: deprecated_member_use
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
          ),
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
          _loadHtml();
          webViewController.addJavaScriptHandler(
          handlerName: 'OnMessage',
          callback: (args) {
            // Handle JavaScript message here
            Fluttertoast.showToast(
              msg: "Evento de mensagem",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0 );
          },
        );
        },
        onLoadStop: (controller, url) async {
          await webViewController.evaluateJavascript(source: '''
            socket.addEventListener('message', function(event) {
              console.log("Emitindo para o flutter evento de mensagem")
              window.flutter_inappwebview.callHandler('OnMessage', event.text);
            });
          ''');
          
        },
        onConsoleMessage: (controller, consoleMessage) {
          print(consoleMessage.message); // Logs console messages from the WebView
        },
        onLoadResource: (controller, resource) {
          // Handle resource load if necessary
        },
        onLoadError: (controller, url, code, message) {
          print("Failed to load $url: $message");
        }
      ),
    );
  }

  _loadHtml() async {
    await webViewController.loadUrl(urlRequest: URLRequest(url: Uri.parse("fenix.url.com")));
  }
}
