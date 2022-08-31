import 'package:flutter/material.dart';
import 'SearchingENG.dart';

class TextFeildDesgin extends StatelessWidget {
  const TextFeildDesgin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Focus(
            onFocusChange: (hasFocus) {
              if(hasFocus) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            child: TextField(
              onTap: () {
                showSearch(context: context, delegate: SE());
              },
              decoration: const InputDecoration(
                hintText: ' Search',
                labelText: 'CHB',
                labelStyle: TextStyle(),
                prefix: Icon(Icons.search),
                border: OutlineInputBorder(),

              ),
            ),
          ),
        ),
      ),
    );
  }
}
