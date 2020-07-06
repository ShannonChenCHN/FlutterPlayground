import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    final rightBarButton =
        IconButton(icon: Icon(Icons.list), onPressed: _pushSaved);
    final appBar = AppBar(
        title: Text('Startup Name Generator'), actions: [rightBarButton]);
    return Scaffold(appBar: appBar, body: _buildSuggestions());
  }

  void _pushSaved() {
    final pageRouteBuilder = (BuildContext context) {
      final tiles = _saved.map(
        (WordPair pair) {
          final title = Text(pair.asPascalCase, style: _biggerFont);
          return ListTile(title: title);
        },
      );
      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      final appBar = AppBar(title: Text('Saved Suggestions'));
      return Scaffold(appBar: appBar, body: ListView(children: divided));
    };
    final pageRoute = MaterialPageRoute<void>(builder: pageRouteBuilder);
    Navigator.of(context).push(pageRoute);
  }

  Widget _buildSuggestions() {
    final itemBuilder = (BuildContext _context, int i) {
      if (i.isOdd) {
        return Divider();
      }

      final int index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    };

    return ListView.builder(
        padding: const EdgeInsets.all(16), itemBuilder: itemBuilder);
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    final title = Text(pair.asPascalCase, style: _biggerFont);
    final icon = Icon(
      alreadySaved ? Icons.favorite : Icons.favorite_border,
      color: alreadySaved ? Colors.red : null,
    );
    final onTap = () {
      setState(() {
        if (alreadySaved) {
          _saved.remove(pair);
        } else {
          _saved.add(pair);
        }
      });
    };
    return ListTile(title: title, trailing: icon, onTap: onTap);
  }
}
