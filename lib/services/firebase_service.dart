import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deaf_mute_educational_app/models/cards.dart';

class FirebaseService {
  final StreamController<Cards> _cardController = StreamController<Cards>();

  FirebaseService() {
    Firestore.instance
        .collection('informations')
        .document('cards')
        .snapshots()
        .listen(_cardsUpdated);
  }

  Stream<Cards> get appCards => _cardController.stream;

  void _cardsUpdated(DocumentSnapshot snapshot){
    _cardController.add(Cards.fromSnapshot(snapshot));
  }

}
