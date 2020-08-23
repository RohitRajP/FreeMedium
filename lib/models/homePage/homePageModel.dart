import 'package:freemedium/imports.dart';

/// class to hold the model for HomePage
class HomePageModel extends ChangeNotifier {
  // holds the loading percentage of the webview
  int _loadingPercentage = 0;
  // holds the user authentication flag
  bool _userAuthenticated = false;

  /// getter for _loadingPercentage
  int get loadingPercentage => _loadingPercentage;

  /// getter for _userAuthenticated
  bool get userAuthenticated => _userAuthenticated;

  /// setter for _loadingPercentage
  set loadingPercentage(int value) {
    _loadingPercentage = value;
    notifyListeners();
  }

  /// setter for _userAuthenticated
  set userAuthenticated(bool value) {
    if (value != null) {
      _userAuthenticated = value;
      // setting shared preference value too
      SharedPrefsOps().setUserAuthentication(value: value);
      notifyListeners();
    }
  }
}
