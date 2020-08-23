// import 'package:freemedium/imports.dart';
import 'package:freemedium/global/controllers/homePage/homePageControllers.dart';

/// used to handle willPopScope callback
Future<bool> willPopScopeCallbackFun() async {
  // checking if the browser can go back
  if (await webViewController.canGoBack()) {
    webViewController.goBack();
    return false;
  } else {
    return true;
  }
}
