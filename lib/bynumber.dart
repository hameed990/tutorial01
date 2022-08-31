import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'ENGPDF.dart';
import 'Maps.dart';
import 'SearchingENG.dart';

class TextNumber extends StatelessWidget {
  const TextNumber({Key? key}) : super(key: key);

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
                showSearch(context: context, delegate: SEbynamber());
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

class SEbynamber extends SearchDelegate {
  final List<String> _CHBNumber = chbNumbersMap.keys.toList();

  // @override
  // // TODO: implement keyboardType
  // //   TextInputType? get keyboardType => TextInputType.number;
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    String pdfName = chbNumbersMap[query].toString();
    if (pdfName == 'null') {
      return const Center(
          child: Text(
        'Invalid CHB Number',
        style: TextStyle(
          fontSize: 23,
        ),
      ));
    }
    return PDFViewerFromAsset(
      pdfAssetPath: 'CHB/$pdfName',
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = _CHBNumber.where((number) {
      return number.startsWith(query.toUpperCase());
    }).toList().reversed;
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          String pdfName =
              chbNumbersMap[suggestions.elementAt(index)].toString();
          String title = suggestions.elementAt(index);
          String Subtitle =
              'CHB: ${chbReversedMap[suggestions.elementAt(index)]}';
          return ListTile(
            title: Text(title),
            subtitle: Text(Subtitle),
            onTap: () {
              query = title;
              showResults(context);
            },
          );
        });
  }
}
