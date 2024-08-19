# app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Using WebSocket Event
To Test we use message event
 - Message event is sent when sending or receiving message in chat

Use websocket
- To use the event websocket  on webview, you need to know the event names
- After mapping the name of the events, it is necessary to inject javascript to add the window event listener when the event is emitted

### Example

```dart
    await webViewController.evaluateJavascript(source: '''
        socket.addEventListener('message', function(event) {
            window.flutter_inappwebview.callHandler('OnMessage', event);
        });
        ''');
    
    webViewController.addJavaScriptHandler(
          handlerName: 'OnMessage',
          callback: (args) {
            // Action on receive event
           
          },
        );
```
