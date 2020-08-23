import 'package:freemedium/imports.dart';

/// class to hold the shared preference operations
class SharedPrefsOps {
  /// used to check if the user has authenticated
  void checkUserAuthentication() async {
    // creating instance of sharedPreference value
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    // context for provider operations
    BuildContext context = homePageScaffoldKey.currentContext;
    // setting provider model value
    Provider.of<HomePageModel>(context, listen: false).userAuthenticated =
        _prefs.getBool("userAuthenticated");
  }

  /// used to set the user authenticated flag
  void setUserAuthentication({@required bool value}) async {
    // creating instance of sharedPreference value
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("userAuthenticated", value);
  }
}
