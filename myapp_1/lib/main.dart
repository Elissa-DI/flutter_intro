import 'package:flutter/material.dart';
import 'quote.dart';

void main() {
  runApp(MaterialApp(home: QuoteList()));
}

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(author: 'John Doe', text: 'Believe in yourself, and work hard'),
    Quote(
      author: 'Jane Smith',
      text: 'Stay positive, work hard, make it happen.',
    ),
    Quote(
      author: 'Master Ninja',
      text: 'Move in silence, strike with precision.',
    ),
  ];

  Widget quoteTemplate(quote) {
    return QuoteCard(
      quote: quote,
      delete: () {
        setState(() {
          quotes.remove(quote);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Awesome Quotes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) => quoteTemplate(quote)).toList(),
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final VoidCallback delete;
  const QuoteCard({super.key, required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
            ),
            SizedBox(height: 6.0),
            Text(
              quote.author,
              style: TextStyle(fontSize: 14.0, color: Colors.grey[800]),
            ),
            SizedBox(height: 8.0),
            TextButton.icon(
              onPressed: delete,
              label: Text('Delete quote'),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
