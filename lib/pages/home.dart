import 'package:app/pages/webview.page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Home' , style: TextStyle(fontWeight: FontWeight.w700)),
          centerTitle: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white
      ),
      body: Column(
        children: [
         Center(
            child: 
              ElevatedButton(
              onPressed: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => WebViewPage()));
              },
              child: const Text('Chat With WebView'),
          ),
        ),                 // ← Change to this.
        ],
      ),
      
    );
   }
}