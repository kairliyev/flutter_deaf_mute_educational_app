import 'package:flutter/material.dart';
import 'package:deaf_mute_educational_app/enums/view_state.dart';
import 'package:deaf_mute_educational_app/scoped_models/home_view_model.dart';
import 'package:deaf_mute_educational_app/ui/shared/app_colors.dart';
import 'package:deaf_mute_educational_app/ui/shared/ui_reducers.dart';
import 'package:deaf_mute_educational_app/ui/views/base_view.dart';


class HomeView extends StatelessWidget {
  static const BoxDecoration topLineBorderDecoration = BoxDecoration(
      border: Border(
          top: BorderSide(
              color: lightGrey, style: BorderStyle.solid, width: 5.0)));

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              title: AppBar(
                title: Text(
                  "Методы изучения жестового языка",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
            body: _getBody(model, context)));
  }

  Widget _getBody(HomeViewModel model, BuildContext context) {
    switch (model.state) {
      case ViewState.Busy:
      case ViewState.Idle:
        return Center(child: CircularProgressIndicator());
      default:
        return _getStatsUi(model, context);
    }
  }

  Widget _getStatsUi(HomeViewModel model, BuildContext context) {
    return Container(
      child: Center(child: imageCenter(model)),
    );
  }

  Widget imageCenter(HomeViewModel model) {
    var changer = model.appCards.cardName;
    if (changer == "good_afternoon") {
      return Image.asset("assets/greeting/good_afternoon.jpg");
    } else if (changer == "good") {
      return Image.asset("assets/greeting/good.jpg");
    } else if (changer == "good_morning") {
      return Image.asset("assets/greeting/good_morning.jpg");
    } else if (changer == "how_are_you") {
      return Image.asset("assets/greeting/how_are_you.jpg");
    } else if (changer == "sorry") {
      return Image.asset("assets/greeting/sorry.jpg");
    } else if (changer == "thank_you") {
      return Image.asset("assets/greeting/thank_you.jpg");
    } else if (changer == "greeting") {
      return Image.asset("assets/greeting/greeting.jpg");
    } else {
      return Container();
    }
  }

  Widget _getHeightContainer(
      {double height,
      BuildContext context,
      Widget child,
      bool hasTopStroke = false}) {
    return Container(
        height: height,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: hasTopStroke ? topLineBorderDecoration : null,
        child: child);
  }
}
