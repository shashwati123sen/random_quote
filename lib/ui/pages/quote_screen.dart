import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:random_quote/ui/common/quote_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuoteScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('quotes').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return _LoadingIndicator();
          final documents = snapshot.data!.docs;
          return PageView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final document = documents[index];
              return QuoteWidget(
                backgroundColor: _randomColor.randomColor(
                  colorBrightness: ColorBrightness.dark,
                ),
                quote: document['quote'],
                author: document['Author'],
              );
            },
          );
        },
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
