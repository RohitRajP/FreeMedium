import 'package:freemedium/imports.dart';

/// class to hold the model for HomePage
class ArticleViewPageModel extends ChangeNotifier {
  // holds the loading percentage of the webview
  int _loadingPercentage = 0;

  /// getter for _loadingPercentage
  int get loadingPercentage => _loadingPercentage;

  /// setter for _loadingPercentage
  set loadingPercentage(int value) {
    _loadingPercentage = value;
    notifyListeners();
  }
}
