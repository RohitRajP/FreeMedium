import 'package:freemedium/imports.dart';
import 'package:freemedium/global/controllers/homePage/homePageControllers.dart';

/// holds the floatingActionBar for the app
Widget floatingActionButtonW() {
  return Consumer<HomePageModel>(
    builder: (context, value, child) {
      // getting the loading percentage
      int _loadingPercent = value.loadingPercentage;
      return FloatingActionButton.extended(
        onPressed: (_loadingPercent == 100)
            ? () {
                webViewController.reload();
              }
            : () {},
        label: (_loadingPercent == 100) ? Text("Refresh") : Text("Loading"),
        icon: (_loadingPercent == 100)
            ? Icon(Icons.refresh)
            : CircularPercentIndicator(
                radius: 18.0,
                animateFromLastPercent: true,
                animation: true,
                progressColor: GlobalThemes().colorConstants["primaryWhite"],
                backgroundColor: GlobalThemes().colorConstants["primaryColor"],
                lineWidth: 3,
                percent: _loadingPercent / 100,
              ),
      );
    },
  );
}
