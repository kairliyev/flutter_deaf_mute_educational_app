import 'package:scoped_model/scoped_model.dart';

import 'package:deaf_mute_educational_app/enums/view_state.dart';
// Make sure state enum is accessible in all inherting models
export 'package:deaf_mute_educational_app/enums/view_state.dart';

class BaseModel extends Model {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;

    // Notify listeners will only update listeners of state.
    notifyListeners();
  }
}
