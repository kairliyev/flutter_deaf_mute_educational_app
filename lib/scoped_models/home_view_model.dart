import 'package:deaf_mute_educational_app/service_locator.dart';
import 'package:deaf_mute_educational_app/services/firebase_service.dart';
import 'package:deaf_mute_educational_app/models/cards.dart';
import 'base_model.dart';

class HomeViewModel extends BaseModel {
  FirebaseService _firebaseService = locator<FirebaseService>();
  Cards appCards;

  HomeViewModel() {
    _firebaseService.appCards.listen(_onCardsUpdated);
  }

  void _onCardsUpdated(Cards cards) {
    appCards = cards;

    if (cards == null) {
      setState(ViewState.Busy);
    } else {
      setState(ViewState.DataFetched);
    }
  }

}
