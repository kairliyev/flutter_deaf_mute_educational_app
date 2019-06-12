import 'package:cloud_firestore/cloud_firestore.dart';

class Cards {
  final String cardName;

  Cards({this.cardName});

  Cards.fromSnapshot(DocumentSnapshot snapShot)
      : cardName = snapShot['name'] ?? "";
}
