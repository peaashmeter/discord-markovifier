import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  final id = arguments.first;
  const String start = 'START ';
  const String end = ' END';

  var input = File('input.json').readAsStringSync();
  var messages = jsonDecode(input)['messages'];

  List<String> fromId = [];
  (messages as List)
      .where((m) => m['author']['id'] == id)
      .forEach((n) => fromId.add(start + n['content'] + end));

  Map<String, Map<String, double>> dictionary = {};
  Map<String, List<String>> secondsWords = {};

  var words = fromId
      .fold('',
          (previousValue, element) => (previousValue as String) + ' ' + element)
      .replaceAll(RegExp('\n'), '')
      .replaceAll(',', ' ,')
      .replaceAll('.', ' .')
      .replaceAll('!', ' !')
      .replaceAll(' ?', ' ?')
      .toLowerCase()
      .split(' ');

  print('Generated a transition matrix for ${words.length} words.');

  for (var i = 0; i < words.length - 1; i++) {
    if (words[i] != 'END' && words[i] != '') {
      if (secondsWords[words[i]] == null) {
        secondsWords.addAll({
          words[i]: [words[i + 1]]
        });
      } else {
        secondsWords[words[i]]!.add(words[i + 1]);
      }
    }
  }

  for (var word in secondsWords.keys) {
    var _set = secondsWords[word]!.toSet()
      ..removeWhere((element) => element == '');

    if (dictionary[word] == null) {
      dictionary.addAll({word: {}});
    }

    for (var w in _set) {
      //считаем, сколько раз после слова word идет слово w
      var count = secondsWords[word]!.where((_w) => _w == w).length;

      if (dictionary[word]![w] == null) {
        dictionary[word]!.addAll({w: count.toDouble()});
      }
    }

    //узнаем, сколько всего слов идет после word
    var sum = secondsWords[word]!.length;
    for (var w in dictionary[word]!.keys) {
      dictionary[word]![w] = dictionary[word]![w]! / sum;
    }
  }

  var dictionaryJson = jsonEncode(dictionary);

  var output = File('output.json');
  output.writeAsStringSync(dictionaryJson);
}
