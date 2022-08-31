import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'ENGPDF.dart';
import 'Maps.dart';

class SE extends SearchDelegate {
  var pdfName = '';
  late BuildContext mycontext;
  final List<String> _CHBList = chbNamesMap.keys.toList();
  final List<String> _CHBNumber = chbNumbersMap.keys.toList();
  bool number = false;
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
    IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    if (query.isEmpty){
      return const Text("");
    }
    pdfName = (number
            ? chbNumbersMap[query.substring(1)]
            : chbNamesMap[query.toUpperCase()])
        .toString();
    if (pdfName == 'null') {
      return Center(
          child: Text(
        'Invalid CHB ${number ? 'Number' : 'Name'}',
        style: const TextStyle(
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
    number = query.startsWith("#");

    final suggestions =
        (number?_CHBNumber:_CHBList).where((name) {
          return name.contains(
              number ? query.replaceAll('#', '') : query.toUpperCase());
        }).toList().reversed;

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index) {
          String title = suggestions.elementAt(index);
          pdfName = (number
              ? chbNumbersMap[title.substring(1)]
              : chbNamesMap[title.toUpperCase()])
              .toString();
          String subtitle =
              'CHB: ${number ? chbReversedMap[suggestions.elementAt(index)] : pdfName.substring(0, pdfName.indexOf('_'))}';

          return ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            onTap: () {
              pdfName = (number
                  ? chbNumbersMap[title]
                  : chbNamesMap[title.toUpperCase()])
                  .toString();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute<dynamic>(
              //     builder: (_) => PDFViewerFromAsset(
              //       pdfAssetPath: 'CHB/$pdfName',
              //     ),
              //   ),
              // );
              query = number?"#$title":title;
              showResults(context);
            },
          );
        });
  }

  // void openPDF(BuildContext context, String pdfName) {
  //   SchedulerBinding.instance.addPostFrameCallback((_) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute<dynamic>(
  //         builder: (_) => PDFViewerFromAsset(
  //           pdfAssetPath: 'CHB/$pdfName',
  //         ),
  //       ),
  //     );
  //   });
  // }
}
