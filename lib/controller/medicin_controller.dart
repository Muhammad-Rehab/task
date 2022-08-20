import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/drug.dart';

class MedicineProvider extends ChangeNotifier {
  List<String> diseases = [];

  List<Drug> disData = [];

  int indexForDisease = 0;

  getData() async {
    if (disData.isNotEmpty) {
      return;
    }
    var data0 = await http.get(
      Uri.parse('https://pastebin.com/raw/jKVv22p8'),
    );
    var data = jsonDecode(data0.body);
    diseases = data['problems'][0].keys.toList();
    for (int i = 0; i < diseases.length; i++) {
      if (data['problems'][0][diseases[indexForDisease]][0].isEmpty) {
        indexForDisease++;
      } else {
        data['problems'][0][diseases[indexForDisease]][0]['medications'][0]
                ['medicationsClasses'][0]
            .values
            .toList()
            .forEach((element) {
          element[0].values.toList().forEach((drug) {
            disData.add(Drug(diseases[indexForDisease], drug[0]['name'],
                drug[0]['dose'], drug[0]['strength']));
          });
        });
        indexForDisease++;
      }
    }
    indexForDisease = 0;
    notifyListeners();
  }
}
